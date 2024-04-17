
import 'wieghted_value_model.dart';

class Criterion {
  final String name;
  final double weight;
  final List<WeightedValue> values;

  Criterion(this.name, this.values, {required this.weight, });
}
