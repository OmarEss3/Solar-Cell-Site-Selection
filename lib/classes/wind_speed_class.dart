class WindSpeed {
  String level;

  WindSpeed(this.level);

  int calculate() {
    switch (level) {
      case 'Hard wind (10–12)':
        return 3;
      case 'Windy (8–10)':
      case 'Wind light (5–8)':
        return 4;
      case 'No wind or low (0–5)':
        return 1;
      default:
        return 0;
    }
  }
}
