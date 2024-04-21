import 'package:flutter/material.dart';
import 'package:solar_app/view.dart/LearnView.dart';
import 'package:solar_app/widgets.dart/welcome_screen_button.dart';
import '../wieghts.dart';
import 'calculation_view1.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Solar Cell Site Selection App',
                  style: TextStyle(
                    fontSize: 67,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                WelcomeScreenButton(
                  hint: 'Start',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalculationView(
                            criteria: criteria),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                WelcomeScreenButton(
                  hint: 'Learn More',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LearnMoreView()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
