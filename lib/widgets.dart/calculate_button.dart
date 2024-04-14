import 'package:flutter/material.dart';
import 'package:solar_app/classes/LST_class.dart';
import 'package:solar_app/classes/air_humidity_class.dart';
import 'package:solar_app/classes/air_pressure_class.dart';
import 'package:solar_app/classes/air_temp_class.dart';
import 'package:solar_app/classes/wind_speed_class.dart';
import '../classes/aspect_class.dart';
import '../classes/land_use_class.dart';
import '../classes/slop_class.dart';
import '../classes/solar_irridation_class.dart';
import '../classes/transmission_line_class.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required this.selectedSlope,
    required this.selectedAspect,
    required this.selectedSolarIrradiation,
    required this.selectedLandUse,
    required this.selectedWindSpeed,
    required this.selectedAirTemperature,
    required this.selectedAirPressure,
    required this.selectedAirHumidity,
    required this.selectedLandSurfaceTemperature,
    required this.selectedTransmissionLine,
  });

  final String selectedSlope;
  final String selectedAspect;
  final String selectedSolarIrradiation;
  final String selectedLandUse;
  final String selectedWindSpeed;
  final String selectedAirTemperature;
  final String selectedAirPressure;
  final String selectedAirHumidity;
  final String selectedLandSurfaceTemperature;
  final String selectedTransmissionLine;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Calculate total score based on selected factors
        int totalScore = Slope(selectedSlope).calculate() +
            Aspect(selectedAspect).calculate() +
            SolarIrradiation(selectedSolarIrradiation).calculate() +
            LandUse(selectedLandUse).calculate() +
            WindSpeed(selectedWindSpeed).calculate() +
            AirTemperature(selectedAirTemperature).calculate() +
            AirPressure(selectedAirPressure).calculate() +
            AirHumidity(selectedAirHumidity).calculate() +
            LST(selectedLandSurfaceTemperature).calculate() +
            TransmissionLine(selectedTransmissionLine).calculate();

        // Display the total score
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Site Report'),
              content: Text(
                  'Success percentage is ${((totalScore / 39) * 100).toStringAsFixed(2)} %'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(
          Colors.yellow[300],
        ),
      ),
      child: const Text('Calculate'),
    );
  }
}
