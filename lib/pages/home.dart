import 'package:ams/pages/loginPage.dart';
import 'package:ams/pages/signUp.dart';
import 'package:flutter/material.dart';


import '../main.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}



class _MyHomePageState extends State<MyHomePage> {

  var Signin = true;


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1 ,milliseconds: 200), () {
      if(Signin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Signup()),
        );
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left:20.0, right:10.0, top:250.0,bottom: 0.0), // Adjust padding as needed
              child: Text(
                'Attendance Management',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('assets/images/checklist.png', height: 500.0 ),
            ),
          ),
        ],
      ),
    );
  }
}
