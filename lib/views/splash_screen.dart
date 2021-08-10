import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double iconSize = 0.0;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        iconSize = 0.2;
      });
    });
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/homescreen');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: height * iconSize,
          height: height * iconSize,
          child: ClipOval(
            child: Image.asset(
              "assets/images/splash_clock.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
