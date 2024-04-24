import 'package:flutter/material.dart';
import 'package:solar_app/views/learn_view.dart';
import 'package:solar_app/widgets.dart/home_view_button.dart';
import '../wieghts.dart';
import 'calculation_view1.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
                HomeViewButton(
                  hint: 'Start',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CalculationView(criteria: criteria),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                HomeViewButton(
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