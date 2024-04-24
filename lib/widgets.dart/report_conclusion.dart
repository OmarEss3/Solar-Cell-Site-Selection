
String buildOverallConclusion(double totalScore1, double totalScore2) {
  String conclusion;
  if (totalScore1 > totalScore2) {
    conclusion = 'Site 1 is more suitable for building solar cells.';
  } else if (totalScore1 < totalScore2) {
    conclusion = 'Site 2 is more suitable for building solar cells.';
  } else {
    conclusion =
        'Both sites have similar suitability for building solar cells.';
  }

  return conclusion;
}
