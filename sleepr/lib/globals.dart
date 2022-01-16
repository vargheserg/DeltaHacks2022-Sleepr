import 'dart:collection';
import 'package:flutter/material.dart';

TimeOfDay wakeupTime = const TimeOfDay(hour: 8, minute: 0);
int hoursOfSleep = 8;
HashMap<String,List<String>> sleepInfo = HashMap();
int numEntries = 0;
TimeOfDay onboardingWakeupTime = const TimeOfDay(hour: 8, minute: 0);
TimeOfDay onboardingSleepTime = const TimeOfDay(hour: 0, minute: 0);
bool newUser = false;

