// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sleepr/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget  {
  const Calendar({Key? key}) : super(key: key);


 @override
  _Calendar createState() => _Calendar();


}





class _Calendar extends State<Calendar> {
  CalendarFormat format = CalendarFormat.twoWeeks;

  List<String> _getEventsForDay(DateTime day) {
    // Implementation example
    return ["January 12 - 90 points", "10:45P.M. - 7:30A.M, slept for 8:45"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cardBorderRadius),
              color: cardBackground,
            ),
            child: TableCalendar<String>(
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
              eventLoader: _getEventsForDay,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
            ),
          ),
          const SizedBox(height: eventOffset,),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "joe mama"
            ),
          )
        ]
      )
    );
  }
}