import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:solar_app/Services/generate_1site_pdf.dart';
import '../../widgets.dart/build_table.dart';
import '../../wieghts.dart';
import '../widgets.dart/CustomWrap.dart';

class OneSiteReportView extends StatelessWidget {
  final List<String> slctdPrcntgs;
  final double totalScore;
  final Map<String, String> slctdVal;
  const OneSiteReportView(
      {required this.slctdPrcntgs,
      required this.slctdVal,
      required this.totalScore,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suitability Report'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'This is a report to analyze the suitability of your Site:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              buildResultTable(
                'Site:',
                slctdPrcntgs,
                criteria,
                slctdVal,
                totalScore,
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              customWrap(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final pdfFile = await generate1SitePDF(
            'Site 1',
            slctdPrcntgs,
            criteria,
            slctdVal,
            totalScore,
          );
          Share.shareFiles([pdfFile.path], text: 'Here is your report!');
        },
        backgroundColor: Colors.yellow.shade300,
        shape: const StadiumBorder(),
        child: const Icon(Icons.share),
      ),
    );
  }
}
