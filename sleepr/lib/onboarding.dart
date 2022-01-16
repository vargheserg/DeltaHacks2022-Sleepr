import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleepr/constants.dart';
import 'package:sleepr/globals.dart';
import 'package:intl/intl.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'globals.dart';
import 'main.dart';

late TabController onboardingController;


class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _Onboarding createState() => _Onboarding();
}


class _Onboarding extends State<Onboarding> with TickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    onboardingController = TabController(vsync: this, length: 3);

  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(child:
    Scaffold(
        resizeToAvoidBottomInset: false,
        body: getOnboardingView(context)),
        onWillPop: () async {return false;},
    );
  }
}


getOnboardingView(context) {
  return SingleChildScrollView(
    child: Container(
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 12),
            child: Center(
              child: Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 35,
                    child: TabBarView(
                      controller: onboardingController,
                      children: <Widget>[
                        Onboarding1(),
                        Onboarding2(),
                        Onboarding3(),
                      ],
                    ),
                  )),
            ),
          ),
          TabPageSelector(
            controller: onboardingController,
            color: topBackgroundGradient,
            selectedColor: calendarLightText,
          ),
        ],
      ),
    ),
  );
}

class Onboarding1 extends StatefulWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  _Onboarding1 createState() => _Onboarding1();
}


class _Onboarding1 extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Image.asset('assets/images/sleeping.png',
                scale: 1.4),
          ),
          const Text('What time do you usually sleep?',
              style: TextStyle(fontSize: 18)),
          GestureDetector(
            onTap: () {_selectTime(context);},
            child: Text( DateFormat.jm().format(DateTime(1,1,1,onboardingSleepTime.hour,onboardingSleepTime.minute)),
            style:const TextStyle(
                fontWeight: FontWeight.bold,
                color: calendarLightText,
                fontSize: 45.0))),

          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(cardBorderRadius),
              side: const BorderSide(
                color: calendarLightText,
              ),
            ),
            onPressed: () {onboardingController.animateTo((onboardingController.index + 1) % 2);},
            // padding:
            // const EdgeInsets.fromLTRB(155, 10, 155, 10),
            color: cardBackground,
            textColor: calendarLightText,
            child: const Text('next',
                style: TextStyle(fontSize: 15)),
          ),
        ]

    );
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked_s = await showTimePicker(
      initialTime: onboardingSleepTime,
      context: context,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(wakeupTime != picked_s && picked_s != null) {
      setState(() {
        onboardingSleepTime = picked_s;
      });
    }
  }

}


class Onboarding2 extends StatefulWidget {
  const Onboarding2({Key? key}) : super(key: key);

  @override
  _Onboarding2 createState() => _Onboarding2();
}


class _Onboarding2 extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Image.asset('assets/images/sun.png',
                scale: 1.4),
          ),
          const Text('What time do you usually wake up?',
              style: TextStyle(fontSize: 18)),
          GestureDetector(
              onTap: () {_selectTime(context);},
              child: Text( DateFormat.jm().format(DateTime(1,1,1,onboardingWakeupTime.hour,onboardingWakeupTime.minute)),
                  style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: calendarLightText,
                      fontSize: 45.0))),

          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(cardBorderRadius),
              side: const BorderSide(
                color: calendarLightText,
              ),
            ),
            onPressed: () {onboardingController.animateTo((onboardingController.index + 1) % 3);},
            // padding:
            // const EdgeInsets.fromLTRB(155, 10, 155, 10),
            color: cardBackground,
            textColor: calendarLightText,
            child: const Text('next',
                style: TextStyle(fontSize: 15)),
          ),

        ]

    );
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked_s = await showTimePicker(
      initialTime: onboardingWakeupTime,
      context: context,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(wakeupTime != picked_s && picked_s != null) {
      setState(() {
        onboardingWakeupTime = picked_s;
      });
    }
  }
}
class Onboarding3 extends StatefulWidget {
  const Onboarding3({Key? key}) : super(key: key);

  @override
  _Onboarding3 createState() => _Onboarding3();
}


class _Onboarding3 extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Image.asset('assets/images/wakeup.png',
                scale: 1.4),
          ),
          const Text('What time do you want to wake up?',
              style: TextStyle(fontSize: 18)),
          GestureDetector(
              onTap: () {_selectTime(context);},
              child: Text( DateFormat.jm().format(DateTime(1,1,1,wakeupTime.hour,wakeupTime.minute)),
                  style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: calendarLightText,
                      fontSize: 45.0))),

          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(cardBorderRadius),
              side: const BorderSide(
                color: calendarLightText,
              ),
            ),
            onPressed: () {newUser = true;updateNewUser(); Navigator.pop(context);},
            // padding:
            // const EdgeInsets.fromLTRB(155, 10, 155, 10),
            color: cardBackground,
            textColor: calendarLightText,
            child: const Text('done',
                style: TextStyle(fontSize: 15)),
          ),

        ]

    );
  }


  Future<void> updateNewUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("newUser", 1);
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked_s = await showTimePicker(
      initialTime: wakeupTime,
      context: context,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(wakeupTime != picked_s && picked_s != null) {
      setState(() {
        wakeupTime = picked_s;
      });
    }
  }
}
