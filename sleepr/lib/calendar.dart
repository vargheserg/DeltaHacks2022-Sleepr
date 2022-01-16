// ignore_for_file: prefer_const_constructors
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sleepr/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'globals.dart';

class Calendar extends StatefulWidget  {
  const Calendar({Key? key}) : super(key: key);


 @override
  _Calendar createState() => _Calendar();


}





class _Calendar extends State<Calendar> {
  CalendarFormat format = CalendarFormat.twoWeeks;

//  List<String> _getEventsForDay(DateTime day) {
//    // Implementation example
//    return ["January 12 - 90 points", "10:45P.M. - 7:30A.M, slept for 8:45"];
//  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String str1 = DateFormat("MMMMd").format(DateTime.now()) + " - " + sleepInfo[DateTime.now().month.toString()]![0] + "\n";
  String str2 = DateFormat("jm").format(DateTime.now()) + " - " + DateFormat("jm").format(DateTime.now());



  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
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
              focusedDay: _focusedDay,
              firstDay: DateTime(2022),
              lastDay: DateTime(2023),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well

                  str1 = DateFormat("MMMMd").format(selectedDay) + " - " + sleepInfo[selectedDay.month.toString()]![0] + "\n";
                  str2 = sleepInfo[DateTime.now().month.toString()]![1] + " - " + sleepInfo[DateTime.now().month.toString()]![2];
                  // replace DateTime.now() with selectedDay

                });
              },
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
            ),
          ),
          const SizedBox(height: eventOffset),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
            decoration: BoxDecoration(
              color: cardBackground,
              borderRadius:
              BorderRadius.circular(cardBorderRadius),
              border: Border.all(
                  color: calendarLightText,
                  width: borderWidth),
            ),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: str1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: calendarLightText)),
                    TextSpan(text: str2),
                  ],
                ),
            ),
          ),
        ]
      )
    );
  }
}