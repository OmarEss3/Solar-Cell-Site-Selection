import 'dart:async';

import 'package:flutter/material.dart';
import 'view.dart/welcome_view.dart';

void main() {
  runApp(const SolarApp());
}

class SolarApp extends StatelessWidget {
  const SolarApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criteria Calculator', // App title
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.yellow[300]),
        primarySwatch: Colors.blue, // App theme color
      ),
      home: const WelcomeScreen(), // Show welcome screen initially
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust animation duration as needed
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.repeat(reverse: true); // Make the animation loop
    _navigateToMainPage();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToMainPage() {
    // Delay navigation to the main page for 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Adjust background color as needed
      body: Center(
        child: FadeTransition(
          opacity: _fadeInFadeOut,
          child: Image.asset(
            'assets/icon.jpeg', // Path to your image asset
            width: 200, // Adjust width as needed
            height: 200, // Adjust height as needed
          ),
        ),
      ),
    );
  }
}
