class Aspect {
  String direction;
  
  Aspect(this.direction);

  int calculate() {
    switch (direction) {
      case 'South':
        return 4;
      case 'South West':
      case 'South East':
        return 2;
      case 'North':
      case 'North East':
      case 'North West':
      case 'West':
      case 'East':
      case 'Flat':
        return 1;
      default:
        return 0;
    }
  }
}
