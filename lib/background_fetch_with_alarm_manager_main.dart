import 'package:backgroundfetch/provider/local_notification_provider.dart';
import 'package:backgroundfetch/repositories/local_notification_repository.dart';
import 'package:backgroundfetch/utils/Database_helper.dart';
import 'package:backgroundfetch/views/add_new_time.dart';
import 'package:backgroundfetch/views/home_screen.dart';
import 'package:backgroundfetch/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

DatabaseHelper databaseHelper = new DatabaseHelper();
LocalNotificationRepository localNotificationRepository =
    new LocalNotificationRepository();

void sendNotification() async {
  List<String> alarmList = [];
  alarmList = await databaseHelper.getAlarm();
  if (alarmList != null) {
    for (var item in alarmList) {
 //     print("item : $item");

      String date =
          DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now().toLocal());
     // print("date: $date");
      if (date == item) {
      //  print("showing noti");
        localNotificationRepository.testnotification(time: item);
      }
    }
  }
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  localNotificationRepository.initNotification();
  final int helloAlarmID = 0;
  runApp(MyApp());
  await AndroidAlarmManager.periodic(
      const Duration(milliseconds: 100), helloAlarmID, sendNotification);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LocalNotificationProvider>(
              create: (_) => LocalNotificationProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          routes: {
            '/': (context) => SplashScreen(),
            '/homescreen': (context) => HomeScreen(),
            '/addAlarm': (context) => AddNewTimeSreen()
          },
        ));
  }
}
