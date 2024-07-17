import 'package:flutter/material.dart';
import 'history.dart'; // Import your attendance calendar page file

class AttendancePage extends StatefulWidget {
  @override
  _AttendanceMarkingPageState createState() => _AttendanceMarkingPageState();
}

class _AttendanceMarkingPageState extends State<AttendancePage> {
  String _selectedAttendance = 'Present'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Mark Attendance',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mark Your Attendance',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              // Attendance selection
              Row(
                children: [
                  Text('Select Attendance:'),
                  SizedBox(width: 10.0),
                  DropdownButton<String>(
                    value: _selectedAttendance,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedAttendance = newValue!;
                      });
                    },
                    items: <String>['Present', 'Absent', 'Half Day', 'Leave']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              // Submit button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
                ),
                onPressed: () {
                  // Navigate to AttendanceCalendarPage after marking attendance
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceCalendarPage(),
                    ),
                  );
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
