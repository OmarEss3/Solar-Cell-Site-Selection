import 'package:flutter/material.dart';
import 'view.dart/welcome_view.dart';

void main() {
  runApp(const SolarApp());
}

class SolarApp extends StatelessWidget {
  const SolarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Criteria Calculator', // App title
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.yellow[300]),
          primarySwatch: Colors.blue, // App theme color
        ),
        home: const WelcomePage() // Main home page with criteria
        );
  }
}
