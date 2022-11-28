import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cabento/constants/constants.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:cabento/pages/login_signup/register.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String phoneNumber;
  String phoneIsoCode;
  DateTime currentBackPressTime;
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: WillPopScope(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(fixPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Image.asset(
                    'assets/transparent-icon.png',
                    width: 200.0,
                    fit: BoxFit.fitWidth,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text('Signin with Phone Number', style: greyHeadingStyle),
                  heightSpace,
                  heightSpace,
                  Container(
                    padding: EdgeInsets.only(left: fixPadding),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(width: 0.3, color: primaryColor),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 1.5,
                          spreadRadius: 1.5,
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                    child: InternationalPhoneInput(
                      onPhoneNumberChange: onPhoneNumberChange,
                      initialPhoneNumber: phoneNumber,
                      initialSelection: phoneIsoCode,
                      enabledCountries: [
                        '+233',
                        '+1',
                        '+91',
                        '+596',
                        '+689',
                        '+262',
                        '+241',
                        '+220',
                        '+995',
                        '+49',
                        '+350'
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15.0),
                        hintText: 'Phone Number',
                        hintStyle: greyHeadingStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Container(
                    child: SizedBox(
                      height: 50.0,
                      width: width - (fixPadding * 2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: Register()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: whiteTextButtonTextStyle,
                        ),
                      ),
                    ),
                  ),
                  heightSpace,
                  Text('We\'ll send OTP for Verification.',
                      style: greyNormalTextStyle),
                ],
              ),
            ),
          ],
        ),
        onWillPop: onWillPop,
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return Future.value(false);
    }
    exit(0);
    return Future.value(true);
  }
}
