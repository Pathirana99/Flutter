import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/second_pages.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SecondPageModels(
      title: 'Calender',
      content: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.05,
        ),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2048, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: screenWidth * 0.06,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: screenWidth * 0.06,
                ),
              ),
              calendarStyle: CalendarStyle(
                weekendTextStyle: TextStyle(
                  color: Colors.red,
                  fontSize: screenWidth * 0.04,
                ),
                todayDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                outsideTextStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: screenWidth * 0.035,
                ),
                defaultTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: const Color(0xFFF8F40B),
                  fontSize: screenWidth * 0.04,
                ),
                weekendStyle: TextStyle(
                  color: Colors.red,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.3,
                  vertical: screenHeight * 0.02,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                ),
              ),
              child: Text(
                "Note",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.05, // Responsive text size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
