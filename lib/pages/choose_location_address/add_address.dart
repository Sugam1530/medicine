import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/bottom_bar.dart';
import 'package:page_transition/page_transition.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  bool home = false, work = false, other = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Text('Add Address', style: appBarTitleStyle),
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          width: width,
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: width - fixPadding * 4.0,
                height: 50.0,
                child: ElevatedButton(
                  child: Text(
                    'Add',
                    style: appBarTitleStyle,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: BottomBar()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: width,
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Deliver To Start
                Text('Deliver To', style: primaryColorHeadingStyle),
                heightSpace,
                Container(
                  width: width - (fixPadding * 4.0),
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        width: 0.8, color: greyColor.withOpacity(0.6)),
                  ),
                  child: TextField(
                    style: searchTextStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'e.g. John Doe',
                      hintStyle: searchTextStyle,
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                heightSpace,
                Text('The bill will be prepared against this name',
                    style: subHeadingStyle),
                // Deliver To End
                heightSpace,
                heightSpace,
                // Mobile Number Start
                Text('Mobile Number', style: primaryColorHeadingStyle),
                heightSpace,
                Container(
                  width: width - (fixPadding * 4.0),
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        width: 0.8, color: greyColor.withOpacity(0.6)),
                  ),
                  child: TextField(
                    style: searchTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'e.g. +1 123456',
                      hintStyle: searchTextStyle,
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                heightSpace,
                Text('For all delivery related communication',
                    style: subHeadingStyle),
                // Mobile Number End
                heightSpace,
                heightSpace,
                // Pincode Start
                Text('Pincode', style: primaryColorHeadingStyle),
                heightSpace,
                Container(
                  width: width - (fixPadding * 24.0),
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        width: 0.8, color: greyColor.withOpacity(0.6)),
                  ),
                  child: TextField(
                    style: searchTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'e.g. 10001',
                      hintStyle: searchTextStyle,
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Pincode End

                heightSpace,
                heightSpace,
                // House Number and Building Start
                Text('House Number and Building',
                    style: primaryColorHeadingStyle),
                heightSpace,
                Container(
                  width: width - (fixPadding * 4.0),
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        width: 0.8, color: greyColor.withOpacity(0.6)),
                  ),
                  child: TextField(
                    style: searchTextStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'e.g. Oberoi Heights',
                      hintStyle: searchTextStyle,
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // House Number and Building End
                heightSpace,
                heightSpace,
                // Street Name Start
                Text('Street Name', style: primaryColorHeadingStyle),
                heightSpace,
                Container(
                  width: width - (fixPadding * 4.0),
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        width: 0.8, color: greyColor.withOpacity(0.6)),
                  ),
                  child: TextField(
                    style: searchTextStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'e.g. Back Street',
                      hintStyle: searchTextStyle,
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Street Name End
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: fixPadding * 2.0),
                child: Text('Address Type', style: primaryColorBigHeadingStyle),
              ),
              heightSpace,
              Container(
                width: width,
                color: greyColor.withOpacity(0.2),
                padding: EdgeInsets.only(
                    top: fixPadding * 2.0, bottom: fixPadding * 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getAddressTypeTile('assets/icons/icon_9.png', 'Home'),
                    getAddressTypeTile('assets/icons/icon_10.png', 'Work'),
                    getAddressTypeTile('assets/icons/icon_11.png', 'Other'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getAddressTypeTile(String imagePath, String title) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (title == 'Home') {
          setState(() {
            home = true;
            work = false;
            other = false;
          });
        } else if (title == 'Work') {
          setState(() {
            home = false;
            work = true;
            other = false;
          });
        } else if (title == 'Other') {
          setState(() {
            home = false;
            work = false;
            other = true;
          });
        }
      },
      child: Container(
        width: (width - (fixPadding * 4.0)) / 3.0,
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: primaryColor),
          borderRadius: BorderRadius.circular(10.0),
          color: (title == 'Home')
              ? (home)
                  ? greyColor.withOpacity(0.6)
                  : whiteColor
              : (title == 'Work')
                  ? (work)
                      ? greyColor.withOpacity(0.6)
                      : whiteColor
                  : (other)
                      ? greyColor.withOpacity(0.6)
                      : whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 25.0, fit: BoxFit.fitWidth),
            SizedBox(width: 5.0),
            Text(title, style: primaryColorHeadingStyle),
          ],
        ),
      ),
    );
  }
}
