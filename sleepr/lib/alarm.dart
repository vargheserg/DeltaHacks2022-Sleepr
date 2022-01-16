import 'package:flutter/material.dart';
import 'package:sleepr/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  _Alarm createState() => _Alarm();
}

class _Alarm extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Image.asset('assets/images/Logo01.png', scale: 1.1),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Try to sleep by'),
                  TextSpan(
                      text: ' 9:45 PM ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'today, \nYou are not going to get gold tonight anyway.'),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
            child: Container(
              width: 300.0,
              height: 300.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [topAlarmGradient, cardBackground]),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 280.0,
                  height: 280.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: calendarLightText, width: borderWidth + 1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Your alarm is set for\n\n'),
                          TextSpan(
                              text: '7:30 AM\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: calendarLightText,
                                  fontSize: 45.0)),   
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
              children: <TextSpan>[
                TextSpan(text: 'You will be waken up softly from \n'),
                TextSpan(
                    text: ' 7:15 AM - 7:30 AM ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
