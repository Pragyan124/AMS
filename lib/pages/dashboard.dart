import 'package:flutter/material.dart';
import 'userInfo.dart';  // Import the UserInfoPage
import 'attendance.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Dashboard', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Attendance Records - Wrap with GestureDetector for navigation
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AttendancePage()),
                );
              },
              child: Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Attendance Records',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      // Example attendance records
                      ListTile(
                        title: Text('Attendance on 2024-07-17'),
                        subtitle: Text('Present'),
                        trailing: Icon(Icons.check_circle, color: Colors.green),
                      ),
                      ListTile(
                        title: Text('Attendance on 2024-07-16'),
                        subtitle: Text('Absent'),
                        trailing: Icon(Icons.cancel, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Upcoming Events and Notifications
            Card(
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upcoming Events and Notifications',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    // Example events and notifications
                    ListTile(
                      title: Text('Webinar on Flutter Development'),
                      subtitle: Text('July 20, 2024 at 10:00 AM'),
                      trailing: Icon(Icons.event, color: Colors.blue),
                    ),
                    ListTile(
                      title: Text('New Notification'),
                      subtitle: Text('You have a new message'),
                      trailing: Icon(Icons.notifications, color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // User Information and Profile Updates - Wrap with GestureDetector for navigation
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserInfo()),
                );
              },
              child: Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Information and Profile Updates',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      // Example user information and profile update
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/hey.png'), // Placeholder image
                        ),
                        title: Text('Pragyan Borthakur'),
                        subtitle: Text('xyz@email.com'),
                        trailing: Icon(Icons.edit),
                        onTap: () {
                          // Handle profile update action
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserInfo()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
