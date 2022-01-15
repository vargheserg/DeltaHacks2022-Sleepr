import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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