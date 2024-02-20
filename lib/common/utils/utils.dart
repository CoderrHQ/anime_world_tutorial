/// Calculate current Season of the year
/// Based on today's date and time
String getCurrentSeason() {
  final month = DateTime.now().month;

  if (month >= 4 && month <= 6) {
    return 'spring';
  } else if (month >= 7 && month <= 9) {
    return 'summer';
  } else if (month >= 10 && month <= 12) {
    return 'fall';
  } else if (month >= 1 && month <= 3) {
    return 'winter';
  } else {
    throw Exception('This season doesn\'t exsit in reality.');
  }
}
