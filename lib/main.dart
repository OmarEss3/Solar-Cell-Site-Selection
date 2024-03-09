import 'package:flutter/material.dart';

import 'view.dart/calculation_view.dart';

void main() {
  runApp(SolarApp());
}

class SolarApp extends StatelessWidget {
  const SolarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solar Cell Site Selection',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: SolarCellSiteSelectionScreen(),
    );
  }
}
//Source: https://www.nature.com/articles/s41598-021-84257-y/tables/1