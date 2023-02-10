import 'package:intl/intl.dart';

String Timeformating({required String startTime, required String endTime}) {
  DateFormat format = DateFormat("HH:mm:ss");

  DateTime start = format.parse(startTime);
  DateTime end = format.parse(endTime);

  Duration difference = end.difference(start);

  String dur = difference.toString();

  Duration duration = Duration(
      hours: int.parse(dur.split(":")[0]),
      minutes: int.parse(dur.split(":")[1]),
      seconds: int.parse(dur.split(":")[2].split(".")[0]),
      milliseconds: int.parse(dur.split(":")[2].split(".")[1]));

  return "${duration.inHours.toString().padLeft(2, '0')}:"
      "${(duration.inMinutes % 60).toString().padLeft(2, '0')}:"
      "${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
}

String formatedDate(item) {
  String dateTimeString = item.createdAt!;

  DateFormat format1 = DateFormat("yyyy-MM-dd");

  DateTime dateTime = DateTime.parse(dateTimeString);

  return format1.format(dateTime);
}

String TimeConvertionTo12Hr({required String time24}) {
  DateFormat format24 = DateFormat("HH:mm:ss");
  DateFormat format12 = DateFormat("hh:mm");

  DateTime time = format24.parse(time24);

  return format12.format(time);
}
