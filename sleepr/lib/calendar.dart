import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';
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
  CalendarFormat format = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TableCalendar(
            focusedDay: DateTime.now(), 
            firstDay: DateTime(1990), 
            lastDay: DateTime(2050),
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
          )
       ],
    );
  }
}