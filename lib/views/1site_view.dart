import 'package:flutter/material.dart';
import 'package:solar_app/views/calculation_view2.dart';
import '../models/Critirion_model.dart';
import '../models/wieghted_value_model.dart';
import '../wieghts.dart';

final Map<String, String> selectedValues1 = {};

class OneSiteView extends StatefulWidget {
  final List<Criterion> criteria;

  const OneSiteView({Key? key, required this.criteria}) : super(key: key);

  @override
  State<OneSiteView> createState() => _OneSiteViewState();
}

class _OneSiteViewState extends State<OneSiteView> {
  bool canCalculate = false;
  List<String> slctdPrcntgs1 = [];
  double totalScore1 = 0.0;

  void onValueChanged(String criterionName, String value) {
    setState(() {
      selectedValues1[criterionName] = value;
      canCalculate = selectedValues1.values.every((v) => v.isNotEmpty);
    });
  }

  void calculateScore() {
    totalScore1 = 0.0;

    for (var criterion in widget.criteria) {
      final selectedValue = selectedValues1[criterion.name];
      if (selectedValue != null) {
        final weightedValue = criterion.values.firstWhere(
          (wv) => wv.value == selectedValue,
          orElse: () => WeightedValue("", 0),
        );
        totalScore1 += criterion.weight * weightedValue.weight;
        slctdPrcntgs1.add(
            '${(((criterion.weight * weightedValue.weight) / 12.94)*100).toStringAsFixed(2)}%');
      }
    }
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
          value: selectedValues1[criterion.name],
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
        title: const Text('Enter 1st Site info'),
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
                  onPressed: canCalculate
                      ? () {
                          calculateScore();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CalculationView2(
                                      criteria: criteria,
                                      slctdPrcntgs1: slctdPrcntgs1,
                                      totalScore1: totalScore1,
                                      slctdVal1: selectedValues1,
                                    )),
                          );
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.yellow[300]),
                  ),
                  child: const Text('Second Site'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
