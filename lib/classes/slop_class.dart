class Slope {
  String type;

  Slope(this.type);

  int calculate() {
    switch (type) {
      case 'Flat':
        return 4;
      case 'Slightly sloping':
        return 4;
      case 'Sloping':
        return 3;
      case 'Very sloping':
        return 1;
      default:
        return 0;
    }
  }
}
