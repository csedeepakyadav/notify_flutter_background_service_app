import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  SharedPreferences prefs;

  Future addAlaram({@required String dateTime}) async {
    List<String> alarmList = [];
    prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("alarm") == null) {
      //  alarmList = prefs.getStringList("alarm");
      alarmList.add(dateTime.toString());
    } else {
      alarmList = prefs.getStringList("alarm");
      alarmList.add(dateTime.toString());
    }
   // print(alarmList);
    prefs.setStringList("alarm", alarmList);
  }

  Future<List<String>> getAlarm() async {
    List<String> alarm;
    prefs = await SharedPreferences.getInstance();
    alarm = prefs.getStringList("alarm");
    return alarm;
  }

  Future deleteAlarm({@required String dateTime}) async {
    List<String> alarmList = [];
    prefs = await SharedPreferences.getInstance();
    alarmList = prefs.getStringList("alarm");
   
   alarmList.removeWhere((element) => element == dateTime);
 //   print(alarmList);
    prefs.setStringList("alarm", alarmList);
  }
}
