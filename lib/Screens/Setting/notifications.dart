import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class Notifications {
  static final _notification = FlutterLocalNotificationsPlugin();
  
  static init() {
    _notification.initialize(const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings()
    ));
    tz.initializeTimeZones();
  }

  static scheduledNotification(String title, String body, int hours, int minutes) async {
    var androidDetails = AndroidNotificationDetails(
        "Риза",
        "Я риза",
        importance: Importance.max,
      priority: Priority.high
    );

    var iosDetails = DarwinNotificationDetails();
    var notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);
    
    await _notification.zonedSchedule(
        0,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(Duration(hours: hours, minutes: minutes)),
        notificationDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle
        );
  }
}

class IIII extends StatelessWidget {
  const IIII({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ElevatedButton(
            onPressed: (){
              Notifications.scheduledNotification("Риза", "все работает", 1, 2);
            },
            child: Text("jjjdjjd"),
          ),
        ),
      ),
    );
  }
}

