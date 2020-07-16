import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';
import 'dart:async';
import 'bottom_nav_screen.dart';
import 'package:flutter_covid_dashboard_ui/data/data.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
            (status) {
          if (status) {
            _navigateToHome();
          } else {
            _navigateToLogin();
          }
        }
    );
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 1000), () {});

    return true;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => BottomNavScreen()
        )
    );
  }

  void _navigateToLogin(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => BottomNavScreen()
        )
    );
  }

  @override
  Widget build(BuildContext context)
  {
    fetchData();
    return Container(
      decoration: BoxDecoration(
        color: Palette.primaryColor,
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset('assets/images/fiu_logo.png'),
            ],
          ),
        ),
      ),
    );
  }


}