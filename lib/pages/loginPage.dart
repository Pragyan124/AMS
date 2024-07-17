import 'package:flutter/material.dart';
import 'dashboard.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(


        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Text('Employee Login', style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
              TextField(
                decoration: InputDecoration(

                  hintText: 'Enter your username',
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                ),
              textAlign: TextAlign.center),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(

                  hintText: 'Enter your password', border: OutlineInputBorder(borderSide: BorderSide.none)
                ),
                  textAlign: TextAlign.center),
              SizedBox(height: 20.0),
              SizedBox(
                height:70,
                width: 300,
                child: Padding(

                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(

                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.blueAccent),


                    ),
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardPage()),
                      );
                    },
                    child: Text('Login', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
