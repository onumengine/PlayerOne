/// The trackmodel receives its duration as a string formatted like this 864003
/// This function converts it to a string formatted like this 03:45
String changeToFormattedDuration(String duration) {
  final int durationToInt = int.parse(duration);
  final Duration durationObject = Duration(milliseconds: durationToInt);
  final String formattedDurationString = durationObject.toString();
  final List<String> splitString = formattedDurationString.split('.');
  final String splitStringWithoutMilliseconds = splitString[0];
  final List<String> timeStringSplit = splitStringWithoutMilliseconds.split(':');
  timeStringSplit.removeAt(0);
  final StringBuffer buffer = StringBuffer();
  buffer..write(timeStringSplit[0])..write(':')..write(timeStringSplit[1]);
  final String finalString = buffer.toString();
  return finalString;
}