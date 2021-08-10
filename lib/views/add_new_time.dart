import 'package:backgroundfetch/constants/ui_constants.dart';
import 'package:backgroundfetch/provider/local_notification_provider.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewTimeSreen extends StatefulWidget {
  @override
  _AddNewTimeSreenState createState() => _AddNewTimeSreenState();
}

class _AddNewTimeSreenState extends State<AddNewTimeSreen> {
  String newTime = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final localNotificationProvider =
        Provider.of<LocalNotificationProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              Text(
                "Add New Time for background task",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  selectableDayPredicate: (date) {
                    // Disable weekend days to select from the calendar
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }

                    return true;
                  },
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      newTime = val;
                    });
                  },
                  validator: (val) {
                 //   print(val);
                    return null;
                  },
                  onSaved: (val){
                   //  print(val);
                  },
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: kPrimartColor,
                    onPressed: () {
                      if (newTime != "") {
                        localNotificationProvider
                            .insertNewAlarm(dateTime: newTime)
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              "Time Added Successfully",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ));
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "Please Choose a time",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ));
                      }
                    },
                    child: Text(
                      "Add New Time",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
