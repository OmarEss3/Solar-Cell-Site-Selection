class LST {
  String level;

  LST(this.level);

  int calculate() {
    switch (level) {
      case 'So hot':
        return 1;
      case 'Hot':
        return 2;
      case 'Normal':
        return 3;
      case 'Cool':
        return 4;
      default:
        return 0;
    }
  }
}
