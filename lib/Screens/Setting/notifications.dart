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

  static scheduledNotification(String title, String body, int hours, int minuts) async {
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
        _scheduleDaily(DateTime(hours, minuts)),
        notificationDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time
        );
    }
  }
tz.TZDateTime _scheduleDaily(DateTime time) {
  final now = tz.TZDateTime.now(tz.local);
  final schedul = tz.TZDateTime(tz.local, now.year, now.month, now.day,
      time.hour, time.minute, time.second);

  return schedul.isBefore(now)
      ? schedul.add(Duration(days: 1)) : schedul;
}

/*class NotificationsPage extends StatefulWidget {

  @override
  State<NotificationsPage> createState() => _IIIIState();
}

class _IIIIState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ElevatedButton(
            onPressed: (){
              Notifications.scheduledNotification("Риза", "все работает",);
            },
            child: Text("jjjdjjd"),
          ),
        ),
      ),
    );
  }
}*/

