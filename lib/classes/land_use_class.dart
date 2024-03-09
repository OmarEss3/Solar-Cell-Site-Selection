class LandUse {
  String type;

  LandUse(this.type);

  int calculate() {
    switch (type) {
      case 'City structure':
      case 'Industrial commercial and transports':
      case 'Mine and construction areas':
      case 'Fields suitable for agriculture':
      case 'Continuous products':
      case 'Heterogeneous agricultural areas':
      case 'Forests':
      case 'Interior wet areas':
      case 'Wet areas near the shore':
      case 'Inland waters':
      case 'Sea waters':
        return 1;
      case 'Non-agricultural artificial green areas':
      case 'Shrubbery areas':
        return 2;
      case 'Pasture area':
        return 3;
      case 'Areas without vegetation':
        return 3;
      default:
        return 0;
    }
  }
}
