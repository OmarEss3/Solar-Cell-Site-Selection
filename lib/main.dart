import 'package:flutter/material.dart';

import 'models/Critirion_model.dart';
import 'wieghts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criteria Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(criteria: criteria),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<Criterion> criteria;

  const MyHomePage({Key? key, required this.criteria}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, String> _selectedValues = {};
  double _totalScore = 0.0;
  bool _canCalculate = false; // Flag to enable/disable calculate button

  void onValueChanged(String criterionName, String value) {
    setState(() {
      _selectedValues[criterionName] = value;
      _canCalculate = _selectedValues.values
          .every((v) => v.isNotEmpty); // Check if all values are selected
      _calculateScore();
    });
  }

  void _calculateScore() {
    _totalScore = 0.0;
    for (var criterion in widget.criteria) {
      final selectedValue = _selectedValues[criterion.name];
      if (selectedValue != null) {
        try {
          final weightedValue = criterion.values.firstWhere(
            (wv) => wv.value == selectedValue,
            orElse: () => throw Exception("Invalid value selected"),
          );
          _totalScore += criterion.weight * weightedValue.weight;
        } catch (e) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("An invalid value was selected."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
          return;
        }
      }
    }
    setState(() {});
  }

  Widget buildCriterion(
    Criterion criterion,
    Function(String, String) onValueChanged,
  ) {
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
          value: _selectedValues[criterion.name],
          items: criterion.values
              .map((wv) => DropdownMenuItem(
                    value: wv.value,
                    child: Text(wv.value),
                  ))
              .toList(),
          onChanged: (value) => onValueChanged(criterion.name, value!),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a value for ${criterion.name}';
            }
            return null;
          },
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
              for (var criterion in widget.criteria)
                buildCriterion(criterion, onValueChanged),
              const SizedBox(height: 20.0),
              Text(
                'Total Score: ${(_totalScore / 12.94 * 100).toStringAsFixed(2)}%',
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _canCalculate
                    ? _calculateScore
                    : null, // Disable button if !_canCalculate
                child: const Text('Calculate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
