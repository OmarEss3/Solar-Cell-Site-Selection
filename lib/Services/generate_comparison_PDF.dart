import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/Critirion_model.dart';
import '../widgets.dart/report_conclusion.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;

Future<File> generateComparisonPdf(
  String siteName,
  List<String> percentage1,
  List<Criterion> criteria,
  Map<String, String> slctdVals1,
  double totalScore1,
  String siteName2,
  List<String> percentage2,
  List<Criterion> criteria2,
  Map<String, String> slctdVals2,
  double totalScore2,
) async {
  final pdf = pdfWidgets.Document();

  pdf.addPage(
    pdfWidgets.MultiPage(
      build: (context) {
        table(
          String siteName,
          List<String> percentage,
          List<Criterion> criteria,
          Map<String, String> slctdVals,
          double totalScore,
        ) {
          return pdfWidgets.Table(
            border: pdfWidgets.TableBorder.all(),
            children: [
              pdfWidgets.TableRow(
                children: [
                  pdfWidgets.Text('Criterion',
                      style: pdfWidgets.TextStyle(
                          fontWeight: pdfWidgets.FontWeight.bold)),
                  pdfWidgets.Text('Selected',
                      style: pdfWidgets.TextStyle(
                          fontWeight: pdfWidgets.FontWeight.bold)),
                  pdfWidgets.Text('Score',
                      style: pdfWidgets.TextStyle(
                          fontWeight: pdfWidgets.FontWeight.bold)),
                ],
              ),
              ...criteria.map((criterion) {
                final slctdval = slctdVals[criterion.name];
                final score = percentage[criteria.indexOf(criterion)];
                return pdfWidgets.TableRow(
                  children: [
                    pdfWidgets.Text(criterion.name),
                    pdfWidgets.Text(slctdval!),
                    pdfWidgets.Text(score.toString()),
                  ],
                );
              }).toList(),
              pdfWidgets.TableRow(
                children: [
                  pdfWidgets.Text('Total Score:',
                      style: pdfWidgets.TextStyle(
                          fontWeight: pdfWidgets.FontWeight.bold)),
                  pdfWidgets.Text(''),
                  pdfWidgets.Text(
                      '${(totalScore / 12.94 * 100).toStringAsFixed(2)}%',
                      style: pdfWidgets.TextStyle(
                          fontWeight: pdfWidgets.FontWeight.bold)),
                ],
              ),
            ],
          );
        }

        return [
          pdfWidgets.Header(level: 0, text: 'Comparison Report'),
          pdfWidgets.Paragraph(
            text:
                'This is a report to analyze the suitability between your Two Sites:',
            style: pdfWidgets.TextStyle(
                fontSize: 18, fontWeight: pdfWidgets.FontWeight.bold),
          ),
          pdfWidgets.SizedBox(height: 16),
          pdfWidgets.Text('Site 1'),
          pdfWidgets.SizedBox(height: 8),
          table(
            'Site 1',
            percentage1,
            criteria,
            slctdVals1,
            totalScore1,
          ),
          pdfWidgets.SizedBox(height: 16),
          pdfWidgets.Text('Site 2'),
          pdfWidgets.SizedBox(height: 8),
          table(
            'Site 2',
            percentage2,
            criteria,
            slctdVals2,
            totalScore2,
          ),
          pdfWidgets.SizedBox(height: 16),
          pdfWidgets.Paragraph(
            text: buildOverallConclusion(totalScore1, totalScore2),
            style: pdfWidgets.TextStyle(
                fontSize: 16, fontWeight: pdfWidgets.FontWeight.bold),
          )
        ];
      },
    ),
  );

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  await file.writeAsBytes(await pdf.save());
  return file;
}
