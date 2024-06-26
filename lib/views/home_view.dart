import 'package:flutter/material.dart';
import 'package:solar_app/views/1site_Calc_view.dart';
import 'package:solar_app/views/about_view.dart';
import 'package:solar_app/widgets.dart/home_view_button.dart';
import '../wieghts.dart';
import '2site_view/calculation_view1.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  final TextStyle textStyle = const TextStyle(
    fontSize: 16,
    color: Color.fromARGB(236, 255, 255, 255),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/How Solar Panels Work on Cloudy Days _ SunPower Solar Blog.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
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
                  Text(
                    'How optimal your solar site is?',
                    style: textStyle,
                  ),
                  const Spacer(flex: 2),
                  Text(
                    'Do you have one or Two?',
                    style: textStyle,
                  ),
                  const SizedBox(height: 20),
                  HomeViewButtons(
                    hint: 'Two Sites',
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
                    hint: 'One Site',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OneSiteView(
                            criteria: criteria,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  HomeViewButtons(
                    hint: 'about criteria',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutCriteriaView(),
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
