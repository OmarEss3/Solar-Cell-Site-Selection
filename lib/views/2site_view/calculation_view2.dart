import 'package:flutter/material.dart';
import '../../models/Critirion_model.dart';
import '../../models/wieghted_value_model.dart';
import '../report_view.dart';


class CalculationView2 extends StatefulWidget {
  final List<Criterion> criteria;
  final List<String> slctdPrcntgs1;
  final Map<String, String> slctdVal1;

  final double totalScore1;
  const CalculationView2(
      {Key? key,
      required this.slctdVal1,
      required this.criteria,
      required this.slctdPrcntgs1,
      required this.totalScore1})
      : super(key: key);

  @override
  State<CalculationView2> createState() => _CalculationView2State();
}

class _CalculationView2State extends State<CalculationView2> {
  bool canCalculate = false;
  double totalScore2 = 0.0;
  List<String> slctdPrcntgs2 = [];
final Map<String, String> selectedValues2 = {};

  void onValueChanged(String criterionName, String value) {
    setState(() {
      selectedValues2[criterionName] = value;
      canCalculate = selectedValues2.values.every((v) => v.isNotEmpty);
    });
  }

  void calculateScore() {
    totalScore2 = 0.0;

    for (var criterion in widget.criteria) {
      final selectedValue = selectedValues2[criterion.name];
      if (selectedValue != null) {
        final weightedValue = criterion.values.firstWhere(
          (wv) => wv.value == selectedValue,
          orElse: () => WeightedValue("", 0),
        );
        totalScore2 += criterion.weight * weightedValue.weight;
        slctdPrcntgs2.add(
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
          value: selectedValues2[criterion.name],
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
        title: const Text('Enter 2st Site info'),
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
                                builder: (BuildContext context) => ReportView(
                                      slctdVal2: selectedValues2,
                                      slctdVal1: widget. slctdVal1,
                                      slctdPrcntgs1: widget.slctdPrcntgs1,
                                      slctdPrcntgs2: slctdPrcntgs2,
                                      totalScore1: widget.totalScore1,
                                      totalScore2: totalScore2,
                                    )),
                          );
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.yellow[300]),
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
