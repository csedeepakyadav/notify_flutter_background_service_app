# Notify:- Mobile Application ( Flutter - background service)
(Documentation)

## How to run ?

### * Windows

#### -> VS Code 
* flutter pub get (in terminal )
* flutter run (in termninal)

#### -> Android Studio
* open project and click on run.

### * Mac

#### -> VS Code 
* pub get (in terminal )
* cd ios ( move to ios directory of project )
* pod install (in terminal)
* cd.. (interminal)
* flutter run (in termninal)

#### -> Xcode
* open ( project->ios->Runner.xcworkspace ) in xcode.
* click on run.

## Technical Details

* MVVM clean Architecture used using provider.
* for State management Provider Package is used.
* for local database shared preferences package used.
* flutter_background_service package is used for backgroud service.

## Note

* background fetch can also be done with the help of alarm manager and is implemented in the app just comment the main.dart file content and paste the (     background_fetch_with_alarm_manager_main.dart) content in main.dart
* Accuracy of alarm manager is 60-70 % while flutter_background_service have 100 % accuracy.
* in some special case an audio player can be used to listen the background process, code for that is also provided in main.dart, just comment and timer onstart() and uncomment the audioPayer onStart() this will help in listenning.


## In-depth Project Flow

* App starts with background service checks if any alarm is there and keeps checking.
* then navigates to splash screen, here hold for 2 seconds, Then Navigates to home screen.
* at home screen you can add / delete alarm.
* adding alarm will be once by choosing time and date.
* Once alarm set backgroud service will check if alarm is there and at alarm time it will fire the notification.
* Notification will be send even if the app is in the backgroud or completely closed.
* 


## Validations

* Data validation.
* Exception handling.

## Others

* Adaptive App Icon for both Android and iOS used.
* Animation used.
* Sound Null-Safety.

## Test

* ## Tested with Android.

![bg_task](https://user-images.githubusercontent.com/22419021/128858158-ef08eb15-aa5c-448f-a87d-1d805466ccac.png)


* ## Tested with iOS.
   Not yet.

## Download App ( Android )
https://www.dropbox.com/s/0r0l28ae74tqzot/notify_bgs.apk

## Github Repository ( Source Code )
https://github.com/csedeepakyadav/notify_flutter_background_service_app

