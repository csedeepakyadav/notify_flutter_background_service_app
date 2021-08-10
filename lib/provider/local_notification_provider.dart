import 'package:backgroundfetch/utils/Database_helper.dart';
import 'package:flutter/material.dart';

class LocalNotificationProvider extends ChangeNotifier {


  LocalNotificationProvider(){
   getAllAlarm();
  }
  DatabaseHelper databaseHelper = new DatabaseHelper();

  List<String> alarmList = [];

  getAlarmList() => alarmList;

  Future insertNewAlarm({@required String dateTime}) async {
    databaseHelper.addAlaram(dateTime: dateTime).then((value) {
      getAllAlarm();
    });
  }

  Future getAllAlarm() async {
    alarmList = [];
    alarmList = await databaseHelper.getAlarm();
    notifyListeners();
  }

  Future deleteAlarm({@required String dateTime}) async {
    databaseHelper.deleteAlarm(dateTime: dateTime).then((value) {
      getAllAlarm();
    });
  }
}
