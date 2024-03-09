class AirPressure {
  String level;

  AirPressure(this.level);

  int calculate() {
    switch (level) {
      case 'High':
        return 4;
      case 'Normal':
        return 3;
      case 'Low':
        return 2;
      case 'Very low':
        return 1;
      default:
        return 0;
    }
  }
}
