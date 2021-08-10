import 'package:backgroundfetch/constants/ui_constants.dart';
import 'package:backgroundfetch/provider/local_notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final localNotificationProvider =
        Provider.of<LocalNotificationProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            localNotificationProvider.getAlarmList() != null
                ? Container(
                    height: height,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: height * 0.01,
                              left: width * 0.06,
                              right: width * 0.06),
                          height: height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " Notification Alarm",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    height: 1,
                                    width: width * 0.4,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                              Image.asset(
                                "assets/images/splash_clock.png",
                                height: height * 0.05,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          //  height: height * 0.7,
                          //  margin: EdgeInsets.only(bottom: 70),
                          child: ListView.builder(
                              itemCount:
                                  localNotificationProvider.getAlarmList() ==
                                          null
                                      ? 0
                                      : localNotificationProvider
                                          .getAlarmList()
                                          .length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: height * 0.07,
                                  margin: EdgeInsets.symmetric(
                                      vertical: height * 0.01),
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 1,
                                            color: Colors.grey,
                                            offset: Offset(0, 1),
                                            spreadRadius: 1)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width * 0.08,
                                          ),
                                          Text(
                                            localNotificationProvider
                                                .getAlarmList()[index]
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              localNotificationProvider
                                                  .deleteAlarm(
                                                      dateTime:
                                                          localNotificationProvider
                                                                  .getAlarmList()[
                                                              index])
                                                  .then((value) {
                                                setState(() {});
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.green,
                                                  content: Text(
                                                    "Alarm Removed",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ));
                                              });
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.05,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            localNotificationProvider.getAlarmList() == null
                ? Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.08,
                        ),
                        Container(
                          width: height * 0.2,
                          height: height * 0.2,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/splash_clock.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.08,
                        ),
                        Text(
                          "No notification alarm found",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.08,
                        ),
                        Text(
                          "Add new alarm By tapping the add button",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimartColor,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/addAlarm');
          },
        ),
      ),
    );
  }
}
