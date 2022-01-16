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
                  TextSpan(
                      text: 'Try to sleep by'),
                  TextSpan(text: ' 9:45 PM ', 
                  style: TextStyle(
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: 'today, \nYou are not going to get gold tonight anyway.'),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(100.0),
          decoration: const BoxDecoration(
            gradient: ,
            shape: BoxShape.circle
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
                  TextSpan(
                      text: 'You will be waken up softly from \n'),
                  TextSpan(text: ' 7:15 AM - 7:30 AM ', 
                  style: TextStyle(
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
      
      ],
    );
  }
}
