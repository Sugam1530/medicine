import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/cart_payment/cart.dart';
import 'package:cabento/pages/choose_location_address/choose_location.dart';
import 'package:cabento/pages/offer/offer.dart';
import 'package:cabento/pages/products_list/product_list.dart';
import 'package:cabento/pages/search/search.dart';
import 'package:page_transition/page_transition.dart';

class HealthCare extends StatefulWidget {
  @override
  _HealthCareState createState() => _HealthCareState();
}

class _HealthCareState extends State<HealthCare> {
  final offerList = [
    {
      'title': 'Special Offers',
      'image': 'assets/healthcare/1.png',
      'offer': 'Upto 74% off'
    },
    {
      'title': 'Covid Essentials',
      'image': 'assets/healthcare/2.png',
      'offer': 'Upto 77% off'
    },
    {
      'title': 'Daily Essentials',
      'image': 'assets/healthcare/3.png',
      'offer': 'Upto 20% off'
    },
    {
      'title': 'Diabetic Care',
      'image': 'assets/healthcare/4.png',
      'offer': 'Upto 60% off'
    },
    {
      'title': 'Personal Care',
      'image': 'assets/healthcare/5.png',
      'offer': 'Upto 40% off'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Healthcare Products',
              style: appBarTitleStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Deliver To',
                  style: thinWhiteTextStyle,
                ),
                SizedBox(width: 4.0),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: ChooseLocation()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '99501  Anchorage',
                        style: thickWhiteTextStyle,
                      ),
                      Icon(Icons.keyboard_arrow_down,
                          size: 20.0, color: whiteColor),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: Offer()));
            },
            icon: Icon(Icons.local_offer),
          ),
          IconButton(
            icon: Badge(
              badgeContent: Text('1', style: TextStyle(color: whiteColor)),
              badgeColor: redColor,
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: Cart()));
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Container(
            width: width,
            padding: EdgeInsets.all(fixPadding),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft, child: Search()));
              },
              child: Container(
                width: width - fixPadding * 2.0,
                padding: EdgeInsets.all(fixPadding * 0.9),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search, color: primaryColor, size: 18.0),
                    widthSpace,
                    Text(
                      'Search medicines/healthcare products',
                      style: searchTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: offerList.length,
        itemBuilder: (context, index) {
          final item = offerList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ProductList()));
            },
            child: Container(
              margin: EdgeInsets.only(
                top: fixPadding * 2.0,
                right: fixPadding * 2.0,
                left: fixPadding * 2.0,
                bottom:
                    (index == (offerList.length - 1)) ? fixPadding * 2.0 : 0.0,
              ),
              padding: EdgeInsets.all(fixPadding * 2.0),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 0.2, color: primaryColor),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 1.5,
                    spreadRadius: 1.5,
                    color: Colors.grey[200],
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title'], style: primaryColorHeadingStyle),
                      SizedBox(height: 4.0),
                      Text(item['offer'],
                          style: primaryColorNormalThinTextStyle),
                    ],
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset(
                      item['image'],
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
