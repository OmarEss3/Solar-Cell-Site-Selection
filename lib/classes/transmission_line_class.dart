class TransmissionLine {
  String distance;

  TransmissionLine(this.distance);

  int calculate() {
    switch (distance) {
      case '0–500 m':
        return 4;
      case '500–1000 m':
        return 3;
      case '1000–1500 m':
        return 2;
      case '1500–2000 m':
        return 1;
      case '2000 m >':
        return 1;
      default:
        return 0;
    }
  }
}
