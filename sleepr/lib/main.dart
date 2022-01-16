import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleepr/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:sleepr/settingstate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart';
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
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black12,
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
  bool _isloading = false;
  @override
  void initState() {
    super.initState();
    dataLoadFunction();
  }

  dataLoadFunction() async {
    setState(() {
      _isloading = true;
    });
    //await Future.delayed(Duration(seconds: 3));

    // initialize everything you need asynchronously here
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? a = prefs.getInt('hoursOfSleep');
    int? b = prefs.getInt('wakeuphour');
    int? c = prefs.getInt('wakeupminute');
    List<String>? d = prefs.getStringList('calendar');
    int? e = prefs.getInt('numEntries');
    if (a != null) {
      hoursOfSleep = a;
    }
    if (b != null && c != null) {
      wakeupTime = TimeOfDay(hour: b, minute: c);
    }
    if (e != null) {
      numEntries = e;
    }
    if (d != null) {
      toCalendar(d);
    }


    setState(() {
      _isloading = false;
    });

  }

  splashScreen() {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Image(
        image: NetworkImage("https://cdn.discordapp.com/attachments/432737375119081482/932063650011836427/Logo01.png"),
        ),
      ],
    ),
    );
  }

  CalendarFormat format = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading ? splashScreen() :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Calendar(),
            const ListTile(
              title: Text('You should be sleeping at this time:'),
              subtitle: Text('9:30 PM'),
              tileColor: Colors.grey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsPage()),
          );
        },
        tooltip: 'Update preferences',
        child: const Icon(Icons.settings),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
