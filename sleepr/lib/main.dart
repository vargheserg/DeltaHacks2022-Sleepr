import 'package:flutter/material.dart';
import 'package:sleepr/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:sleepr/constants.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleepr',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: primarySwatch,
        primaryColor: primaryColor,
        brightness:brightness,
        accentColor: accentColor,
        accentIconTheme: accentIconTheme,
        dividerColor: dividerColor,
      ),
      home: const MyHomePage(title: 'Sleepr'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalendarFormat format = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                topBackgroundGradient,
                botBackgroundGradient,
              ],
            ),
          ),
          child: Padding(padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset('assets/images/Logo01.png'),
                    ),
                  
                  const Calendar(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(0,20,0,20),
                    decoration: BoxDecoration(
                      color: cardBackground,
                      borderRadius: BorderRadius.circular(cardBorderRadius),
                      border: Border.all(color: calendarLightText, width: borderWidth),
                    ),
                    
                    child: Center(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'January 12 - 90 points\n', style: TextStyle(fontWeight: FontWeight.bold, color: calendarLightText)),
                            TextSpan(text: '7:15 AM - 7:30 AM'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cardBorderRadius),
                    side: const BorderSide(
                      color: calendarLightText,
                      width: borderWidth,
                      ),
                    ),
                    onPressed: () {},
                    padding: const EdgeInsets.fromLTRB(155,10,155,10),
                    color: cardBackground,
                    textColor: calendarLightText,
                    child: const Text("Settings",
                        style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
