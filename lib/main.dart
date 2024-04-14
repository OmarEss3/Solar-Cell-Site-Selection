import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final criteria = [
    Criterion(
      "ClimateGlobal solar irradiance (Wh/m²)",
      [
        WeightedValue("< 4.20", 0.3),
        WeightedValue("4.21+", 0.7),
      ],
      weight: 0.3,
      rank: 1,
    ),
    Criterion(
      "TopographyAspect (Azimuth angle)",
      [
        WeightedValue("0 (flat)", 0.2),
        WeightedValue("10–22.5 (North)", 0.4),
        WeightedValue("22.5–67.5 (Northeast)", 0.5),
        WeightedValue("67.5–112.5 (East)", 0.6),
        WeightedValue("112.5–157.5 (Southeast)", 0.3),
        WeightedValue("157.5–202.5 (South)", 0.1),
        WeightedValue("202.5–247.5 (Southwest)", 0.2),
        WeightedValue("247.5–292.5 (West)", 0.7),
        WeightedValue("292.5–337.5 (Northwest)", 0.5),
        WeightedValue("337.5–360 (North)", 0.8),
      ],
      weight: 0.2,
      rank: 2,
    ),
    Criterion(
      "Slope (degrees)",
      [
        WeightedValue("0–5 degrees", 0.8),
        WeightedValue(">= 5 degrees", 0.2),
      ],
      weight: 0.5,
      rank: 3,
    ),
    Criterion(
      "Climate (Wind)Wind Speed (Velocity)",
      [
        WeightedValue("4.5–5.6", 0.4),
        WeightedValue("5.6–6.4", 0.6),
        WeightedValue("6.7–7.0", 0.8),
        WeightedValue("7.0–7.5", 1.0),
      ],
      weight: 0.7,
      rank: 1,
    ),
    Criterion(
      "TopographyElevation",
      [
        WeightedValue("< 200", 0.1),
        WeightedValue("200–400", 0.3),
        WeightedValue("400–500", 0.5),
        WeightedValue("500–700", 0.7),
        WeightedValue("4700–8745", 0.9),
      ],
      weight: 0.4,
      rank: 2,
    ),
    Criterion(
      "InfrastructureDistance to conversion stations (meter)",
      [
        WeightedValue("0–10,000", 0.9),
        WeightedValue("10,001–20,000", 0.8),
        WeightedValue("20,001–30,000", 0.7),
        WeightedValue("30,001–40,000", 0.6),
        WeightedValue("40,001–50,001", 0.5),
        WeightedValue("50,001–100,001", 0.4),
        WeightedValue("100,000–148,348", 0.3),
      ],
      weight: 0.3,
      rank: 3,
    ),
    Criterion(
      "InfrastructureDistance to main roads",
      [
        WeightedValue("0–1,000", 0.8),
        WeightedValue("1,001–2,000", 0.7),
        WeightedValue("2,001–5,000", 0.6),
        WeightedValue("5,001–10,000", 0.5),
        WeightedValue("10,001–20,000", 0.4),
        WeightedValue("20,001–50,000", 0.3),
        WeightedValue("50,001+", 0.2),
      ],
      weight: 0.3,
      rank: 3,
    ),
  ];

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

class Criterion {
  final String name;
  final double weight;
  final List<WeightedValue> values;
  final int rank;

  Criterion(this.name, this.values, {required this.weight, required this.rank});
}

class WeightedValue {
  final String value;
  final double weight;

  WeightedValue(this.value, this.weight);
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

  void onValueChanged(String criterionName, String value) {
    setState(() {
      _selectedValues[criterionName] = value;
      _calculateScore();
    });
  }

  void _calculateScore() {
    _totalScore = 0.0;
    for (var criterion in widget.criteria) {
      final selectedValue = _selectedValues[criterion.name];
      if (selectedValue != null) {
        final weightedValue = criterion.values.firstWhere(
          (wv) => wv.value == selectedValue,
          orElse: () => throw Exception("Invalid value selected"),
        );
        _totalScore +=
            criterion.weight * weightedValue.weight; // No weight factor here
      }
    }
    setState(() {});
  }

  double getFactorWeight(int rank) {
    return 1.0; // No weight factor applied
  }

  Widget buildCriterion(
      Criterion criterion, Function(String, String) onValueChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          criterion.name,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5.0),
        DropdownButtonFormField<String>(
          value: _selectedValues[criterion.name],
          items: criterion.values
              .map((wv) => DropdownMenuItem(
                    value: wv.value,
                    child: Text(wv.value),
                  ))
              .toList(),
          onChanged: (value) => onValueChanged(criterion.name, value!),
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
        child: Column(
          children: [
            for (var criterion in widget.criteria)
              buildCriterion(criterion, onValueChanged),
            const SizedBox(height: 20.0),
            Text(
              'Total Score: ${(_totalScore * 100).toStringAsFixed(2)}%',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _calculateScore,
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
