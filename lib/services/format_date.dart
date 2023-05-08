import 'package:intl/intl.dart';

//* format date from API
String formatDate(String pubLishedAt) {
  DateTime parsedData = DateTime.parse(pubLishedAt);
  String formattedDate = DateFormat('dd-MMM-yyyy | HH:mm').format(parsedData);
  return formattedDate;
}
