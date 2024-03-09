class AirHumidity {
  String level;

  AirHumidity(this.level);

  int calculate() {
    switch (level) {
      case 'High':
        return 1;
      case 'Normal':
        return 2;
      case 'Low':
        return 3;
      case 'Very low':
        return 4;
      default:
        return 0;
    }
  }
}
