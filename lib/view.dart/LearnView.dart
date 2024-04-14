
import 'package:flutter/material.dart';

class LearnView extends StatelessWidget {
  const LearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn More'),
      ),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
                'This app for calculating how good your site is suitable for building solar cell on it according to this criteria:'),
            Text('1.Slope:'),
            Text(
                'the average slope of the land surrounding your home or the site of your solar cell'),
            Text('2.Site Aspect (SA):'),
            Text(
                'is about the location, design, infrastructural provisions and basic amenities of a building or a development.')
          ],
        ),
      )),
    );
  }
}
