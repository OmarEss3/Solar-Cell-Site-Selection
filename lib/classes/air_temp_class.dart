class AirTemperature {
  String level;

  AirTemperature(this.level);

  int calculate() {
    switch (level) {
      case 'Hot':
      case 'Cool':
        return 2;
      case 'A bit hot':
      case 'Normal':
        return 4;
      default:
        return 0;
    }
  }
}
