import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/choose_location_address/add_address.dart';
import 'package:page_transition/page_transition.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: width,
            height: height - 30.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150.0,
                            child: Text('Choose your Location',
                                style: primaryColorExtraBigHeadingStyle),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close,
                                size: 25.0, color: primaryColor),
                          ),
                        ],
                      ),
                      heightSpace,
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: width - (fixPadding * 4.0 + 100.0),
                            height: 43.0,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(5.0)),
                              border:
                                  Border.all(width: 0.8, color: primaryColor),
                            ),
                            child: TextField(
                              style: searchTextStyle,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter PIN Code',
                                hintStyle: searchTextStyle,
                                contentPadding: EdgeInsets.all(8.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 100.0,
                              height: 43.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(5.0)),
                                border:
                                    Border.all(width: 0.8, color: primaryColor),
                              ),
                              child: Text('Check', style: searchWhiteTextStyle),
                            ),
                          ),
                        ],
                      ),
                      heightSpace,
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.my_location,
                              size: 22.0, color: primaryColor),
                          widthSpace,
                          Text('Select Current Location',
                              style: primaryColorHeadingStyle),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: fixPadding * 2.0),
                      child: Text('Saved Addresses',
                          style: primaryColorExtraBigHeadingStyle),
                    ),
                    heightSpace,
                    Container(
                      height: 170.0,
                      width: width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          widthSpace,
                          widthSpace,
                          Container(
                            width: width - fixPadding * 8.0,
                            padding: EdgeInsets.all(fixPadding * 2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 1.0,
                                  color: greyColor.withOpacity(0.6)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  child: Image.asset('assets/icons/icon_9.png',
                                      width: 40.0, fit: BoxFit.fitWidth),
                                ),
                                widthSpace,
                                widthSpace,
                                Container(
                                  width: width -
                                      (fixPadding * 12.0 + 50.0 + 20.0 + 2.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Home',
                                          style: primaryColorBigHeadingStyle),
                                      heightSpace,
                                      Text('Allison Perry',
                                          style: searchTextStyle),
                                      Text('91, Opera Street, Newyork, 10001',
                                          style: searchTextStyle),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          widthSpace,
                          widthSpace,
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: AddAddress()));
                            },
                            child: Container(
                              margin: EdgeInsets.all(0.5),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(10),
                                strokeWidth: 1.2,
                                padding: EdgeInsets.all(fixPadding * 2.0),
                                color: greyColor.withOpacity(0.6),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: primaryColor,
                                          ),
                                          child: Icon(Icons.add,
                                              size: 25.0, color: whiteColor),
                                        ),
                                        heightSpace,
                                        Container(
                                          width: 100.0,
                                          child: Text('Add New Address',
                                              textAlign: TextAlign.center,
                                              style:
                                                  primaryColorBigHeadingStyle),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          widthSpace,
                          widthSpace,
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      margin: EdgeInsets.all(fixPadding * 2.0),
                      padding: EdgeInsets.all(fixPadding * 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: greyColor.withOpacity(0.25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/icon_8.png',
                              width: 45.0, fit: BoxFit.fitWidth),
                          widthSpace,
                          widthSpace,
                          Container(
                            width: width - (fixPadding * 8.0 + 45 + 20.0),
                            child: Text(
                                'Serving More than 1,000 towns and cities.',
                                style: viewAllTextStyle),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
