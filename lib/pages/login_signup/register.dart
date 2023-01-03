import 'package:cabento/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';
import 'package:http/http.dart' ;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  void Register(
    String phone,
    String name,
   String email,
   String password,
  ) async {
    try {
    Response response = await post(
          Uri.parse(
              'https://fusionclient.live/FTL190160/cabento/api/user-signup-update'),
          body: {
            'phone': phone,
            'name': name,
            'email': email,
            'password': password,
            
          });
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                Text('Register your account', style: primaryColorHeadingStyle),
                heightSpace,
                heightSpace,
                heightSpace,
                // Full Name TextField Start
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
                    controller: nameController,
                    style: primaryColorHeadingStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Full Name',
                      hintStyle: primaryColorHeadingStyle,
                      border: InputBorder.none,
                    ),
                  ),
                ),
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
                Container(
                  child: SizedBox(
                    height: 50.0,
                    width: width - (fixPadding * 2.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showLoaderDialog(context);
                        Register(
                            '9494949889',
                            nameController.text.toString().trim(),
                            emailController.text.toString().trim(),
                            passwordController.text.toString().trim(),
                            );

                       
                      },
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
