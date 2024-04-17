import 'models/Critirion_model.dart';
import 'models/wieghted_value_model.dart';

final criteria = [
  Criterion(
    "ClimateGlobal solar irradiance (Wh/m²)",
    [
      WeightedValue("< 4.20", 0),
      WeightedValue(">= 4.20", 1),
    ],
    weight: 0.5,
  ),
  Criterion(
    "Topography Aspect (Azimuth angle)",
    [
      WeightedValue("0 (flat)", 1),
      WeightedValue("0-22.5 (North)", 0),
      WeightedValue("22.5-67.5 (Northeast)", 0),
      WeightedValue("67.5-112.5 (East)", 0),
      WeightedValue("112.5-157.5 (Southeast)", 1),
      WeightedValue("157.5-202.5 (South)", 1),
      WeightedValue("202.5-247.5 (Southwest)", 1),
      WeightedValue("247.5-292.5 (West)", 0),
      WeightedValue("292.5-337.5 (Northwest)", 0),
      WeightedValue("337.5-360 (North)", 0),
    ],
    weight: 0.33,
  ),
  Criterion(
    "Slope (degrees)",
    [
      WeightedValue("0-5 degrees", 1),
      WeightedValue(">= 5 degrees", 0),
    ],
    weight: 0.16,
  ), Criterion(
    "Climate (Wind)Wind Speed (Velocity)",
    [
      WeightedValue("4.5–5.6", 4),
      WeightedValue("5.6–6.4", 5),
      WeightedValue("6.7–7.0", 7),
      WeightedValue("7.0–7.5", 9),
    ],
    weight: 0.50,
  ),
  Criterion(
    "Topography Elevation (meters)",
    [
      WeightedValue("< 200", 1),
      WeightedValue("200-400", 2),
      WeightedValue("400-500", 3),
      WeightedValue("500-700", 4),
      WeightedValue("700-874", 5),
    ],
    weight: 0.33,
  ),
  Criterion(
    "InfrastructureDistance to conversion stations (meter)",
    [
      WeightedValue("0–10,000", 9),
      WeightedValue("10,001–20,000", 8),
      WeightedValue("20,001–30,000", 7),
      WeightedValue("30,001–40,000", 6),
      WeightedValue("40,001–50,001",5),
      WeightedValue("50,001–100,001", 2),
      WeightedValue("100,000–148,348", 1),
    ],
    weight: 0.3,
  ),
  Criterion(
    "InfrastructureDistance to main roads",
    [
      WeightedValue("0–1,000", 0),
      WeightedValue("1,001–2,000", 9),
      WeightedValue("2,001–5,000", 7),
      WeightedValue("5,001–10,000", 5),
      WeightedValue("10,001–58,789", 1),
    ],
    weight: 0.2,
  ),
  Criterion(
    "InfrastructureDistance to Urban areas (meter)",
    [
      WeightedValue("0-5,000", 0),
      WeightedValue("5,001-10,000", 9),
      WeightedValue("10,000-20,000", 7),
      WeightedValue("20,000-50,000", 5),
      WeightedValue(">50,000", 3),
    ],
    weight: 0.1,
  ),
  Criterion(
    "Land Use land Cover",
    [
      WeightedValue("Cultivated land", 0),
      WeightedValue("Bare land/ desert", 1),
      WeightedValue("Urban areas", 0),
      WeightedValue("Water bodies", 0),
      WeightedValue("Protectorates, archaeology", 0),
    ],
    weight: 0.4,
  ),
];
