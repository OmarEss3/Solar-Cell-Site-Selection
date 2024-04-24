import 'package:flutter/material.dart';
import 'package:solar_app/views/learn_view.dart';
import 'package:solar_app/widgets.dart/home_view_button.dart';
import '../wieghts.dart'; // Assuming this is where your 'criteria' variable is defined
import 'calculation_view1.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/How Solar Panels Work on Cloudy Days _ SunPower Solar Blog.jpeg"), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(
                0.5), // Adjust opacity to make it lighter or darker
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        ' Solar',
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Handlee',
                          color: Colors.yellow[300],
                        ),
                      ),
                      const Text(
                        ' App',
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Handlee',
                          color: Color.fromARGB(236, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'To compare between your two sities',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(236, 255, 255, 255),
                    ),
                  ),
                  const Spacer(flex: 2),
                  HomeViewButtons(
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
                  const SizedBox(height: 20),
                  HomeViewButtons(
                    hint: 'Learn More',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LearnMoreView(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
