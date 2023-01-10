import 'dart:convert';
import 'dart:io';

import 'package:cabento/pages/login_signup/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cabento/constants/constants.dart';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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

  var message;

  TextEditingController phoneController = TextEditingController();

// ignore: non_constant_identifier_names
  void Login(String phone) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://fusionclient.live/FTL190160/cabento/api/signup-phone'),
          body: {
            'phone': phone,
          });
      Map<String, dynamic> map = jsonDecode(response.body.toString());
      message = map["message"];

      if (response.statusCode == 200) {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('phone', phone.toString());
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OTPScreen(),
        ));
        // ignore: use_build_context_synchronously
      } else {
        // Navigator.pop(context);
        // ignore: avoid_print
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message.toString(),
            ),
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
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
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        controller: phoneController,
                        //controller: confirm_passwordController,

                        textAlignVertical: TextAlignVertical.center,

                        //textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),

                          //border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'phoneNumber',
                          //alignLabelWithHint: true,
                          labelStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                          prefixIcon: Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Container(
                                margin: EdgeInsets.only(),
                                child: Image.asset(
                                  'assets/india.png',
                                  scale: 18,
                                ),
                              )),
                          prefix: Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text('+91'),
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Container(
                    child: SizedBox(
                      height: 45.0,
                      width: width - (fixPadding * 2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showLoaderDialog(context);
                          Login(
                            phoneController.text.toString().trim(),
                          );
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
