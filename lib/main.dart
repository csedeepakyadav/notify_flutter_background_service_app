import 'dart:async';
import 'package:audioplayer/audioplayer.dart';
import 'package:backgroundfetch/provider/local_notification_provider.dart';
import 'package:backgroundfetch/repositories/local_notification_repository.dart';
import 'package:backgroundfetch/views/splash_screen.dart';
import 'package:backgroundfetch/utils/Database_helper.dart';
import 'package:backgroundfetch/views/add_new_time.dart';
import 'package:backgroundfetch/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

LocalNotificationRepository localNotificationRepository =
    new LocalNotificationRepository();

void sendNotification() async {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  List<String> alarmList = [];
  alarmList = await databaseHelper.getAlarm();
  if (alarmList != null) {
    for (var item in alarmList) {
    //  print("item : $item");

      String date =
          DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now().toLocal());
      //  print("date: $date");
      if (date == item) {
        localNotificationRepository.testnotification(time: item);
      }
    }
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterBackgroundService.initialize(onStart);
  localNotificationRepository.initNotification();
  runApp(MyApp());
}

void onStart() {
  WidgetsFlutterBinding.ensureInitialized();
  new Timer.periodic(Duration(seconds: 30), (Timer t) {
    sendNotification();
  });
}

// more accurate stream with streaming audio
/* 
void onStart() {
  WidgetsFlutterBinding.ensureInitialized();

  final audioPlayer = AudioPlayer();

  String url =
      "https://www.mediacollege.com/downloads/sound-effects/nature/forest/rainforest-ambient.mp3";

  audioPlayer.onPlayerStateChanged.listen((event) {
    sendNotification();
    // print("hello");
    if (event == AudioPlayerState.COMPLETED) {
      audioPlayer.play(url); // repeat
    }
  });

  audioPlayer.play(url);
}
 */

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
