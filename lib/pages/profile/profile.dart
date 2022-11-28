import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/bottom_bar.dart';
import 'package:cabento/pages/login_signup/login.dart';
import 'package:cabento/pages/profile/active_order.dart';
import 'package:page_transition/page_transition.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final mobileNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    mobileNumberController.text = '123456789';
  }

  deletePrescriptionImageDialogue() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 130.0,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Are you sure want to logout?",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width / 3.5),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          'Cancel',
                          style: primaryColorTextButtonTextStyle,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width / 3.5),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          'Logout',
                          style: whiteTextButtonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text('Complete Your Profile', style: appBarTitleStyle),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomBar()));
            },
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: Text(
              'Save',
              style: whiteTextButtonTextStyle,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: width,
            color: whiteColor,
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width - (fixPadding * 4.0),
                  child: TextField(
                    autocorrect: true,
                    style: searchTextStyle,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: subHeadingStyle,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[300], width: 0.6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 0.9),
                      ),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                Container(
                  width: width - (fixPadding * 4.0),
                  child: TextField(
                    controller: mobileNumberController,
                    keyboardType: TextInputType.number,
                    style: searchTextStyle,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      labelStyle: subHeadingStyle,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[300], width: 0.6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 0.9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ActiveOrder()));
            },
            child: Container(
              width: width,
              margin: EdgeInsets.all(fixPadding * 2.0),
              padding: EdgeInsets.all(fixPadding * 1.5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: primaryColor,
              ),
              child: Text('Active Orders', style: whiteColorHeadingStyle),
            ),
          ),
          InkWell(
            onTap: () {
              deletePrescriptionImageDialogue();
            },
            child: Container(
              width: width,
              margin: EdgeInsets.only(
                  right: fixPadding * 2.0,
                  left: fixPadding * 2.0,
                  bottom: fixPadding * 2.0),
              padding: EdgeInsets.all(fixPadding * 1.5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.3, color: primaryColor),
                color: whiteColor,
              ),
              child: Text('Logout', style: primaryColorHeadingStyle),
            ),
          ),
        ],
      ),
    );
  }
}
