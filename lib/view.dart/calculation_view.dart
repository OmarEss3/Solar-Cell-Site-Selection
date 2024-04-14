import 'package:flutter/material.dart';
import '../lists.dart';
import '../widgets.dart/calculate_button.dart';
import '../widgets.dart/customDropDownWidget.dart';

class SolarCellSiteSelectionView extends StatefulWidget {
  @override
  _SolarCellSiteSelectionViewState createState() =>
      _SolarCellSiteSelectionViewState();
}

class _SolarCellSiteSelectionViewState
    extends State<SolarCellSiteSelectionView> {
  String selectedSlope = 'Flat';
  String selectedAspect = 'South';
  String selectedSolarIrradiation = 'Irradiation excess > 42,000,000 W/m2';
  String selectedLandUse = 'City structure';
  String selectedWindSpeed = 'Hard wind (10–12)';
  String selectedAirTemperature = 'Hot';
  String selectedAirPressure = 'High';
  String selectedAirHumidity = 'High';
  String selectedLandSurfaceTemperature = 'So hot';
  String selectedTransmissionLine = '0–500 m';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solar Cell Site Selection'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildDropdownField(selectedSlope, slopeOptions, (String? value) {
              setState(() {
                selectedSlope = value!;
              });
            }, 'Slope'),
            buildDropdownField(selectedAspect, aspectOptions, (String? value) {
              setState(() {
                selectedAspect = value!;
              });
            }, 'Aspect'),
            buildDropdownField(
                selectedSolarIrradiation, solarIrradiationOptions,
                (String? value) {
              setState(() {
                selectedSolarIrradiation = value!;
              });
            }, 'Solar irradiation'),
            buildDropdownField(selectedLandUse, landUseOptions,
                (String? value) {
              setState(() {
                selectedLandUse = value!;
              });
            }, 'Land use'),
            buildDropdownField(selectedWindSpeed, windSpeedOptions,
                (String? value) {
              setState(() {
                selectedWindSpeed = value!;
              });
            }, 'Wind speed'),
            buildDropdownField(selectedAirTemperature, airTemperatureOptions,
                (String? value) {
              setState(() {
                selectedAirTemperature = value!;
              });
            }, 'Air temperature'),
            buildDropdownField(selectedAirPressure, airPressureOptions,
                (String? value) {
              setState(() {
                selectedAirPressure = value!;
              });
            }, 'Air pressure'),
            buildDropdownField(selectedAirHumidity, airHumidityOptions,
                (String? value) {
              setState(() {
                selectedAirHumidity = value!;
              });
            }, 'Air humidity'),
            buildDropdownField(
                selectedLandSurfaceTemperature, landSurfaceTemperatureOptions,
                (String? value) {
              setState(() {
                selectedLandSurfaceTemperature = value!;
              });
            }, 'Land surface Temperature'),
            buildDropdownField(
                selectedTransmissionLine, transmissionLineOptions,
                (String? value) {
              setState(() {
                selectedTransmissionLine = value!;
              });
            }, 'Transmission line'),
            CalculateButton(
              selectedSlope: selectedSlope,
              selectedAspect: selectedAspect,
              selectedSolarIrradiation: selectedSolarIrradiation,
              selectedLandUse: selectedLandUse,
              selectedWindSpeed: selectedWindSpeed,
              selectedAirTemperature: selectedAirTemperature,
              selectedAirPressure: selectedAirPressure,
              selectedAirHumidity: selectedAirHumidity,
              selectedLandSurfaceTemperature: selectedLandSurfaceTemperature,
              selectedTransmissionLine: selectedTransmissionLine,
            ),
          ],
        ),
      ),
    );
  }
}
