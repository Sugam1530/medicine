import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/healthcare/healthcare.dart';
import 'package:cabento/pages/home/home.dart';
import 'package:cabento/pages/notification/notification.dart';
import 'package:cabento/pages/profile/profile.dart';

class BottomBar extends StatefulWidget {
  final int tabIndex;

  BottomBar({Key key, this.tabIndex}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex;
  DateTime currentBackPressTime;
  @override
  void initState() {
    super.initState();
    if (widget.tabIndex == null) {
      currentIndex = 0;
    } else {
      currentIndex = widget.tabIndex;
    }
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        hasNotch: false,
        opacity: 0.2,
        currentIndex: currentIndex,
        onTap: changePage,
        hasInk: true,
        inkColor: primaryColor,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.home,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: primaryColor,
            ),
            title: Text(
              'Home',
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.sentiment_very_satisfied,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.sentiment_very_satisfied,
              color: primaryColor,
            ),
            title: Text(
              'Healthcare',
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.notifications,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.notifications,
              color: primaryColor,
            ),
            title: Text(
              'Notifications',
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.person,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.person,
              color: primaryColor,
            ),
            title: Text(
              'Account',
              style: bottomBarItemStyle,
            ),
          ),
        ],
      ),
      body: WillPopScope(
        child: (currentIndex == 0)
            ? Home()
            : (currentIndex == 1)
                ? HealthCare()
                : (currentIndex == 2)
                    ? Notifications()
                    : Profile(),
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
