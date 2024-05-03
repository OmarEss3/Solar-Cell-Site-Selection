import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../Services/generate_PDF.dart';
import '../widgets.dart/build_table.dart';
import '../widgets.dart/report_conclusion.dart';
import '../wieghts.dart';
import 'learn_view.dart';

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
                'Site 1',
                slctdPrcntgs1,
                criteria,
                slctdVal1,
                totalScore1,
              ),
              const SizedBox(height: 16),
              buildResultTable(
                'Site 2',
                slctdPrcntgs2,
                criteria,
                slctdVal2,
                totalScore2,
              ),
              const SizedBox(height: 16),
              // Overall conclusion
              const Text(
                'Overall Conclusion:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // Calculate and display overall conclusion
              Text(
                buildOverallConclusion(totalScore1, totalScore2),
              ),
              Row(
                children: [
                  const Text(
                      'If you wonder about how each of the criteria affects, you can'),
                  TextButton(
                    child: const Text('Click here!'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LearnMoreView(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final pdfFile = await generatePdf(
            'Site 1',
            slctdPrcntgs1,
            criteria,
            slctdVal1,
            totalScore1,
            'Site 2',
            slctdPrcntgs2,
            criteria,
            slctdVal2,
            totalScore2,
          );
          Share.shareFiles([pdfFile.path],
              text: 'Here is the comparison report!');
        },
        backgroundColor: Colors.yellow.shade300,
        shape: const StadiumBorder(),
        child: const Icon(Icons.share),
      ),
    );
  }
}
