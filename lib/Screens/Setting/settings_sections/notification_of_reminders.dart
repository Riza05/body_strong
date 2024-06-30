import 'package:body_strong/Screens/Setting/notifications.dart';
import 'package:body_strong/Screens/Setting/settings_sections/setting_sections_template.dart';
import 'package:flutter/material.dart';

class NotificationOfReminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingSectionTemplate(
      _NotificationOfReminders(),
      "Особенности рациона"
    );
  }
}

class _NotificationOfReminders extends StatefulWidget {
  const _NotificationOfReminders({super.key});

  @override
  State<_NotificationOfReminders> createState() => _NotificationOfRemindersState();
}

class _NotificationOfRemindersState extends State<_NotificationOfReminders> {
  List texts = [
    "Занятие спортом",
    "Прием воды",
    "Прием завтрака",
    "Прием обеда",
    "Прием перекуса",
    "Прием ужина",
    "Прием витаминов",
  ];
  TimeOfDay timeOfDay = TimeOfDay(hour: 12, minute: 0);
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: texts.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: timeOfDay
                      );
                      if (newTime == null) return;
                      setState(() {
                        timeOfDay = newTime;
                        Notifications.scheduledNotification("kksks","ksksksk", timeOfDay.hour, timeOfDay.minute);
                      });
                    },
                    child: Text(texts[index], style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )
                  )
                ),
                Text("${timeOfDay.hour}:${timeOfDay.minute}")
              ],
            ),
            Divider()
          ],
        );
      }
    );
  }
}
