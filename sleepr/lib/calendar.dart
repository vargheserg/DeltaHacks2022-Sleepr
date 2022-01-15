import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        gradient: const LinearGradient(colors: [Colors.black,Colors.black]), 
      ),
      child: TableCalendar(
        calendarFormat: format,
        headerStyle: const HeaderStyle(
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Color(0xFF5C577C),
            size: 28,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Color(0xFF5C577C),
            size: 28,
          ),
        ),
        focusedDay: DateTime.now(), 
        firstDay: DateTime(1990), 
        lastDay: DateTime(2050),
        onFormatChanged: (CalendarFormat _format) {
          setState(() {
            format = _format;
            });
        },
      )
    );
  }
}