import 'dart:convert';

import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/home/home.dart';
import 'package:cabento/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class user_login extends StatefulWidget {
  const user_login({Key key}) : super(key: key);

  @override
  State<user_login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<user_login> {
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

  var message;
  var token;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
// ignore: non_constant_identifier_names
  void user_Login(String email, password) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://fusionclient.live/FTL190160/cabento/api/user-login'),
          body: {
            'email': email,
            'password': password,
          });
      Map<String, dynamic> map = jsonDecode(response.body.toString());
      token = map["token"];

      if (response.statusCode == 200) {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        //  sharedPreferences.setString('phone', phone.toString());
        sharedPreferences.setString('token', token.toString());
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ButtonBar(),
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
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/transparent-icon.png',
                  width: 200.0,
                  fit: BoxFit.fitWidth,
                ),
                heightSpace,
                heightSpace,
                Text('Lockout your account', style: primaryColorHeadingStyle),
                heightSpace,
                heightSpace,
                heightSpace,
                // Full Name TextField Start

                // Full Name TextField End
                heightSpace,
                heightSpace,
                // Password TextField Start
                Container(
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
                  child: TextField(
                    controller: emailController,
                    style: primaryColorHeadingStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Email Address',
                      hintStyle: primaryColorHeadingStyle,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Password TextField End
                heightSpace,
                heightSpace,
                // Email Address TextField Start
                Container(
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
                  child: TextField(
                    controller: passwordController,
                    style: primaryColorHeadingStyle,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Password',
                      hintStyle: primaryColorHeadingStyle,
                      border: InputBorder.none,
                    ),
                  ),
                ),

                // Email Address TextField End
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,

                Container(
                  child: SizedBox(
                    height: 50.0,
                    // width: width - (fixPadding * 2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () async {
                        showLoaderDialog(context);

                        user_Login(
                          emailController.text.toString().trim(),
                          passwordController.text.toString().trim(),
                        );
                      },
                      child: Text(
                        'Log In',
                        style: whiteTextButtonTextStyle,
                      ),
                    ),
                  ),
                ),
                heightSpace,
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
