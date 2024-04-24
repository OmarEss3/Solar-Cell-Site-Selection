import 'dart:async';

import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/welcom_view.dart';

void main() {
  runApp(const SolarApp());
}

class SolarApp extends StatelessWidget {
  const SolarApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Criteria Calculator', // App title
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.yellow[300]),
        primarySwatch: Colors.blue, // App theme color
      ),
      home: const WelcomeView(), // Show welcome screen initially
    );
  }
}
