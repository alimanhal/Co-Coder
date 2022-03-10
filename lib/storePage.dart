import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class storePage extends StatefulWidget {
  const storePage({Key? key}) : super(key: key);

  @override
  _storePageState createState() => _storePageState();
}

class _storePageState extends State<storePage> {

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calender'),
        ),
        body: Center(
          child: Container(
            child: TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime(1900),
                lastDay: DateTime(2100),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format){
                  setState(() {
                    format = _format;
                  });
            },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                },
                );
                print(focusDay);

              },
                selectedDayPredicate: (DateTime date){
                  return isSameDay(selectedDay, date);
                },
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.circle,
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),

            ),

              ),
          ),
        ),
    );
  }
}
