import 'package:flutter/material.dart';
import 'package:solar_app/view.dart/LearnView.dart';
import 'package:solar_app/view.dart/welcome_view.dart';
import 'view.dart/calculation_view.dart';
import 'widgets.dart/welcome_screen_button.dart';

void main() {
  runApp(const SolarApp());
}

class SolarApp extends StatelessWidget {
  const SolarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solar Cell Site Selection',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const WelcomePage(),
    );
  }
}

