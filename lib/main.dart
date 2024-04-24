import 'package:flutter/material.dart';
import 'views/welcome_view.dart';

void main() {
  runApp(const SolarApp());
}

class SolarApp extends StatelessWidget {
  const SolarApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Criteria Calculator',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.yellow[300]),
      ),
      home: const WelcomeView(), 
    );
  }
}
