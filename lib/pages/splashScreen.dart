import 'dart:async';

import 'package:cabento/pages/bottom_bar.dart';
import 'package:cabento/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/login_signup/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatehome();
  }

  _navigatehome() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('phone');

    if (token != null) {
      await Future.delayed(Duration(milliseconds: 1500), () {});
      Navigator.pushReplacement(
          (context),
          MaterialPageRoute(
            builder: (context) => BottomBar(),
          ));
    } else {
      await Future.delayed(Duration(milliseconds: 1500), () {});
      Navigator.pushReplacement(
          (context),
          MaterialPageRoute(
            builder: (context) => Login(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: Padding(
        padding: EdgeInsets.all(fixPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/transparent-icon.png',
                width: 200.0,
                fit: BoxFit.fitWidth,
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              SpinKitRing(
                color: primaryColor,
                size: 40.0,
                lineWidth: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
