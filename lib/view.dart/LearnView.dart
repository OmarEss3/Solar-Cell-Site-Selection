import 'package:flutter/material.dart';
import 'package:solar_app/models/Critirion_model.dart';
import '../wieghts.dart';

class LearnMoreView extends StatelessWidget {
  // List of descriptions for each criterion
  final List<String> descriptions = [
    "Global solar irradiance refers to the amount of solar radiation received per unit area at a given location on Earth's surface. It is typically measured in watt-hours per square meter (Wh/m²).",
    "Aspect (azimuth angle) of the topography describes the direction in which the slope faces. It influences the amount of sunlight received by a surface.",
    "Slope refers to the steepness of the terrain and affects the efficiency of solar panels. Steeper slopes may require additional mounting structures.",
    "Wind speed or velocity is an important factor in determining the potential for wind energy generation. Higher wind speeds typically indicate greater energy potential.",
    "Elevation refers to the height above sea level. Higher elevations may experience cooler temperatures and thinner air, affecting solar panel efficiency.",
    "Distance to conversion stations measures the proximity to facilities where solar energy is converted into usable electricity.",
    "Distance to main roads indicates accessibility for construction and maintenance vehicles.",
    "Distance to urban areas measures the proximity to densely populated regions, which may affect land use and regulations.",
    "Land use and land cover describes the types of land surface, such as cultivated land, bare land/desert, urban areas, water bodies, and protected areas.",
  ];

  LearnMoreView({super.key});
  TextStyle bold = TextStyle(fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factors Description'),
      ),
      body: ListView.builder(
        itemCount: criteria.length,
        itemBuilder: (BuildContext context, int index) {
          Criterion criterion = criteria[index];
          return ListTile(
            title: Container(
              color: Colors.yellow[300],
              child: Text(
                criterion.name,
                style: bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description:',
                  style: bold,
                ),
                const SizedBox(height: 4),
                Text(descriptions[index]), // Display description from the list
                const SizedBox(height: 4),
                Text(
                  'Weight: ${criterion.weight.toString()}',
                  style: bold,
                ),
                const SizedBox(height: 4),
                Text(
                  'Possible Values:',
                  style: bold,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: criterion.values
                      .map((value) => Text('- ${value.value}'))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
