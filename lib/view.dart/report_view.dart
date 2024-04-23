import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:pdf/pdf.dart';
import 'package:share/share.dart';
import 'dart:io';

import '../models/Critirion_model.dart';
import '../widgets.dart/build_table.dart';
import '../widgets.dart/report_conclusion.dart';
import '../wieghts.dart';

class ReportView extends StatelessWidget {
  final List<String> slctdPrcntgs1;
  final List<String> slctdPrcntgs2;
  final double totalScore1;
  final double totalScore2;
  final Map<String, String> slctdVal1;
  final Map<String, String> slctdVal2;
  const ReportView(
      {required this.slctdPrcntgs1,
      required this.slctdPrcntgs2,
      required this.slctdVal1,
      required this.slctdVal2,
      required this.totalScore1,
      required this.totalScore2,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comparison Report'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'This is a report to analyze the suitability between your Two Sites:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                buildResultTable(
                    'Site 1', slctdPrcntgs1, criteria, slctdVal1, totalScore1),
                const SizedBox(height: 16),
                buildResultTable(
                    'Site 2', slctdPrcntgs2, criteria, slctdVal2, totalScore2),
                const SizedBox(height: 16),
                // Overall conclusion
                const Text(
                  'Overall Conclusion:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // Calculate and display overall conclusion
                buildOverallConclusion(totalScore1, totalScore2),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final pdfFile = await _generatePdf(context);
            Share.shareFiles([pdfFile.path],
                text: 'Here is the comparison report!');
          },
          child: const Icon(Icons.share),
        ));
  }

  Future<File> _generatePdf(BuildContext context) async {
    final pdf = pdfWidgets.Document();
    // Add pages to the PDF document
    pdf.addPage(
      pdfWidgets.MultiPage(
        build: (context) => [
          // Add your PDF content here
        ],
      ),
    );

    // Save the document
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/report.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());
    return file;
  }

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

  Widget buildOverallConclusion(double totalScore1, double totalScore2) {
    String conclusion;
    if (totalScore1 > totalScore2) {
      conclusion = 'Site 1 is more suitable for building solar cells.';
    } else if (totalScore1 < totalScore2) {
      conclusion = 'Site 2 is more suitable for building solar cells.';
    } else {
      conclusion =
          'Both sites have similar suitability for building solar cells.';
    }

    return Text(conclusion);
  }
}
