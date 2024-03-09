class SolarIrradiation {
  String condition;

  SolarIrradiation(this.condition);

  int calculate() {
    switch (condition) {
      case 'Irradiation excess > 42,000,000 W/m2':
        return 4;
      case 'Irradiation too 42,000,000–3,000,000 W/m2':
        return 3;
      case 'Irradiation normal 3,000,000–100,000 W/m2':
        return 2;
      case 'Irradiation low < 100,000 W/m2':
        return 1;
      default:
        return 0;
    }
  }
}
