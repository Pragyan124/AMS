import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils/attendance_utils.dart'; // Ensure this is the correct path

class AttendanceCalendarPage extends StatefulWidget {
  final DateTime selectedDate;

  AttendanceCalendarPage({required this.selectedDate});

  @override
  _AttendanceCalendarPageState createState() => _AttendanceCalendarPageState();
}

class _AttendanceCalendarPageState extends State<AttendanceCalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, String> _attendanceRecords = {};

  @override
  void initState() {
    super.initState();
    _loadAttendanceRecords();
  }

  Future<void> _loadAttendanceRecords() async {
    try {
      Map<DateTime, String> records = await loadAttendanceData();
      setState(() {
        _attendanceRecords = records;
      });
    } catch (e) {
      print('Error loading attendance data: $e');
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Present':
        return Colors.green;
      case 'Absent':
        return Colors.red;
      case 'Half Day':
        return Colors.yellow;
      case 'Leave':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Attendance Calendar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2020, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) => isSameDay(widget.selectedDate, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
            // Update the state if needed based on the selected day
          });
        },
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, date, events) {
            final status = _attendanceRecords[date];
            if (status != null) {
              Color color = _getStatusColor(status);
              return Container(
                margin: const EdgeInsets.all(4.0),
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}
