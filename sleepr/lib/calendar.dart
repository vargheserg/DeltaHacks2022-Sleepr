import 'package:flutter/material.dart';
import 'package:sleepr/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import 'constants.dart';
import 'globals.dart';

toCalendar(List<String> a) {
  for (int i = 0; i < a.length; i+=numSleepInfoFields) {
    var list = [a[i+1],a[i+2],a[i+3]];
    sleepInfo[a[i]] = list;
  }
}

updateSleepInfo(int year, int month, int day, int score, TimeOfDay start, TimeOfDay end) async {
  DateTime tmp = DateTime(year, month, day);
  List<String> val= [score.toString(), DateTime(tmp.year,tmp.month,tmp.day,start.hour,start.minute).toString(), DateTime(tmp.year,tmp.month,tmp.day,end.hour,end.minute).toString()];
  sleepInfo[tmp.toString()] = val;
}

List<dynamic>? getSleepInfo(int year,int month, int day) {
  DateTime tmp = DateTime(year, month,day);
  List<String>? rec = sleepInfo[tmp.toString()];
  if(rec != null) {
    return [int.parse(rec[0]),TimeOfDay.fromDateTime(DateTime.parse(rec[1])),TimeOfDay.fromDateTime(DateTime.parse(rec[1]))];
  } 
  return rec;
}

class Calendar extends StatefulWidget  {
  const Calendar({Key? key}) : super(key: key);

 @override
  _Calendar createState() => _Calendar();


}

class _Calendar extends State<Calendar> {
  CalendarFormat format = CalendarFormat.twoWeeks;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      child: TableCalendar(
        calendarFormat: format,
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: calendarLightText,
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
        headerStyle: const HeaderStyle(
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: calendarLightText,
            size: 28,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: calendarLightText,
            size: 28,
          ),
        ),
        focusedDay: DateTime.now(), 
        firstDay: DateTime(2022), 
        lastDay: DateTime(2023),
        onFormatChanged: (CalendarFormat _format) {
          setState(() {
            format = _format;
            });
        },
      )
    );
  }
}