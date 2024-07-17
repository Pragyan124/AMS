import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceCalendarPage extends StatefulWidget {
  @override
  _AttendanceCalendarPageState createState() => _AttendanceCalendarPageState();
}

class _AttendanceCalendarPageState extends State<AttendanceCalendarPage> {
  late Map<DateTime, List<String>> _attendanceData; // Replace with your attendance data

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    // Initialize attendance data (replace with your actual data)
    _attendanceData = {
      DateTime(2024, 7, 17): ['Present'],
      DateTime(2024, 7, 16): ['Absent'],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Calendar'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TableCalendar(
                calendarFormat: _calendarFormat,
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                startingDayOfWeek: StartingDayOfWeek.sunday,
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  weekendDecoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
                eventLoader: _getEventsForDay,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                ),
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                  });
                  // Handle day selection if needed
                },
              ),
              SizedBox(height: 20.0),
              if (_selectedDay != null && _attendanceData.containsKey(_selectedDay!))
                Column(
                  children: [
                    Text(
                      'Attendance Details for ${_selectedDay!.toString().substring(0, 10)}:',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _attendanceData[_selectedDay!]!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_attendanceData[_selectedDay!]![index]),
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    // Map attendance statuses to event markers or decorators
    return _attendanceData[day] ?? [];
  }
}

