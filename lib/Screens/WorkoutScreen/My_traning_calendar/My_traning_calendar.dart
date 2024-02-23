import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class My_traning_calendar extends StatelessWidget {
  const My_traning_calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _Calendar()
    );
  }
}

class _Calendar extends StatefulWidget {
  const _Calendar({super.key});

  @override
  State<_Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<_Calendar> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusDay){
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: TableCalendar(
                headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: _onDaySelected,
                focusedDay: today,
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2030, 3, 14))
          ),
          Text("sele day= " + today.toString().split(" ")[0])
        ],
      )
    );
  }
}
