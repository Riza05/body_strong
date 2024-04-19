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
  final allChecked = CheckBoxModal(title: "Все");
  final checkBoxList = [
    CheckBoxModal(title: "Прием воды"),
    CheckBoxModal(title: "Прием завтрака"),
    CheckBoxModal(title: "Прием обеда"),
    CheckBoxModal(title: "Прием ужина"),
    CheckBoxModal(title: "Прием перекуса"),
    CheckBoxModal(title: "Прием таблеток"),
    CheckBoxModal(title: "Занятие спортом"),
  ];

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
          value: isChecked,
          onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
            setState(() {
              if (isChecked == false) {
                _showSimpleDialog();
                isChecked = value!;
              } else {
                isChecked = value!;
              }
            });
          },
    );
  }

  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog( // <-- SEE HERE
            title: const Text('Select Booking Type'),
            children: <Widget>[
              timePicker(),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("секунд"),
              ),
          ]
          );
        });}

  Widget timePicker() {
    TimeOfDay timeOfDay = TimeOfDay(hour: 10, minute: 30);
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            TimeOfDay? newTime = await showTimePicker(
              context: context,
              initialTime: timeOfDay,
            );
            if (newTime == null) {
              return;
            } else {
              Notifications.scheduledNotification("kkkdkd", "lmwmw", timeOfDay.hour, timeOfDay.minute);
            }
          },
          child: Text("dlldldld"),
        ),
      ],
    );
  }



    onAllClicked(CheckBoxModal ckdItem) {
    final newValue = !ckdItem.value;
    setState(() {
    ckdItem.value = newValue;
    checkBoxList.forEach((element) {
    element.value = newValue;
    });
    });
    }

    onItemClicked(CheckBoxModal ckdItem) {
    final newValue = !ckdItem.value;
    setState(() {
    ckdItem.value = newValue;

    if(!newValue) {
    allChecked.value = false;
    } else {
    final allListChecked = checkBoxList.every((element) => element.value);
    allChecked.value = allListChecked;
    }
    });
    }
  }



  class CheckBoxModal {
  String title;
  bool value;

  CheckBoxModal({
  required this.title,
  this.value = false
  });
  }

