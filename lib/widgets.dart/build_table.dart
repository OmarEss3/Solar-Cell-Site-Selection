import 'package:flutter/material.dart';
import '../models/Critirion_model.dart';

Widget buildResultTable(
    String siteName,
    List<String> percentage,
    List<Criterion> criteria,
    Map<String, String> slctdVals,
    double totalScore) {
  totalScore = (totalScore / 12.94) * 100;
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$siteName:',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DataTable(
            columns: const [
              DataColumn(label: Text('Criterion')),
              DataColumn(label: Text('Selected')),
              DataColumn(label: Text('Score')),
            ],
            rows: [
              ...criteria.map((criterion) {
                final slctdval = slctdVals[criterion.name];
                final score = percentage[criteria.indexOf(criterion)];
                return DataRow(cells: [
                  DataCell(
                    Text(
                      criterion.name,
                      style: const TextStyle(fontFamily: 'Handlee'),
                    ),
                  ),
                  DataCell(Text(slctdval!)),
                  DataCell(Text(score)),
                ]);
              }).toList(),
              DataRow(cells: [
                const DataCell(
                  Text(
                    'Total Score:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const DataCell(Text('')),
                DataCell(
                  Text(
                    '${totalScore.toStringAsFixed(2)}%',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    ),
  );
}
