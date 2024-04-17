import 'package:flutter/material.dart';
import '../models/Critirion_model.dart';
import '../models/wieghted_value_model.dart';

class CalculationView extends StatefulWidget {
  final List<Criterion> criteria;

  const CalculationView({Key? key, required this.criteria}) : super(key: key);

  @override
  State<CalculationView> createState() => _CalculationViewState();
}

class _CalculationViewState extends State<CalculationView> {
  final Map<String, String> selectedValues = {};
  double totalScore = 0.0;
  bool canCalculate = false;

  void onValueChanged(String criterionName, String value) {
    setState(() {
      selectedValues[criterionName] = value;
      canCalculate = selectedValues.values.every((v) => v.isNotEmpty);
    });
  }

  void calculateScore() {
    totalScore = 0.0;
    for (var criterion in widget.criteria) {
      final selectedValue = selectedValues[criterion.name];
      if (selectedValue != null) {
        final weightedValue = criterion.values.firstWhere(
          (wv) => wv.value == selectedValue,
          orElse: () => WeightedValue("", 0),
        );
        totalScore += criterion.weight * weightedValue.weight;
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Total Score"),
        content: Text(
          'Total Score: ${(totalScore / 12.94 * 100).toStringAsFixed(2)}%',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget buildCriterion(Criterion criterion) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          criterion.name,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5.0),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: 'Select ${criterion.name}',
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: Colors.grey[200],
          ),
          value: selectedValues[criterion.name],
          items: criterion.values
              .map((wv) => DropdownMenuItem(
                    value: wv.value,
                    child: Text(wv.value),
                  ))
              .toList(),
          onChanged: (value) => onValueChanged(criterion.name, value!),
          validator: (value) => value?.isEmpty ?? true
              ? 'Please select a value for ${criterion.name}'
              : null,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criteria Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              for (var criterion in widget.criteria) buildCriterion(criterion),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: canCalculate ? calculateScore : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow[300]),
                  ),
                  child: const Text('Calculate'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
