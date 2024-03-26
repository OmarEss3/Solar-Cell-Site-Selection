import 'package:flutter/material.dart';
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

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solar Cell Site Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Solar Cell Site Selection App',
              style: TextStyle(fontSize: 52),
            ),
            WelcomeScreenButton(
              hint: 'Start',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SolarCellSiteSelectionScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
