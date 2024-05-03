import 'package:flutter/material.dart';
import 'package:solar_app/views/1site_report_view.dart';
import '../models/Critirion_model.dart';
import '../models/wieghted_value_model.dart';

final Map<String, String> selectedValues = {};

class OneSiteView extends StatefulWidget {
  final List<Criterion> criteria;

  const OneSiteView({Key? key, required this.criteria}) : super(key: key);

  @override
  State<OneSiteView> createState() => _OneSiteViewState();
}

class _OneSiteViewState extends State<OneSiteView> {
  bool canCalculate = false;
  List<String> slctdPrcntgs = [];
  double totalScore = 0.0;

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
        slctdPrcntgs.add(
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
                                builder: (BuildContext context) => OneSiteReportView(
                                     
                                      slctdVal:  selectedValues,
                                      slctdPrcntgs: slctdPrcntgs,
                                   
                                      totalScore: totalScore,
                                     
                                    ),),
                          );
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.yellow[300]),
                  ),
                  child: const Text('Get The Report!'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
