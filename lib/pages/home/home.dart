
import 'package:badges/badges.dart';
import 'package:cabento/pages/home/shop_by_brand.dart';
import 'package:cabento/pages/home/shop_by_category.dart';
import 'package:cabento/pages/home/special_category.dart';
import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/cart_payment/cart.dart';
import 'package:cabento/pages/choose_location_address/choose_location.dart';
import 'package:cabento/pages/home/deal_of_the_day_grid.dart';
import 'package:cabento/pages/home/discount_grid.dart';
import 'package:cabento/pages/home/featured_brand_grid.dart';
import 'package:cabento/pages/home/handpicked_item_grid.dart';
import 'package:cabento/pages/home/previous_order_row.dart';
import 'package:cabento/pages/home/slider.dart';
import 'package:cabento/pages/home/top_categories_grid.dart';
import 'package:cabento/pages/offer/offer.dart';
import 'package:cabento/pages/search/search.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:image_cropper/image_cropper.dart';

import 'feedback.dart';
import 'health_articles.dart';
import 'healthcondition.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/transparent-icon.png",
              color: Colors.white,
              scale: 2,
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
                  type: PageTransitionType.rightToLeft,
                  child: Offer(),
                ),
              );
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
                  type: PageTransitionType.rightToLeft,
                  child: Cart(),
                ),
              );
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
      body: ListView(
        children: [
          // Main Slider Start
          MainSlider(),
          // Main Slider Ends
          // Previous Order Row Start
          SpecialCategory(),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Order quickly with prescription",
                style: blackHeadingStyle,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload_file_outlined),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "upload prescription",
                    style: whiteTextButtonTextStyle,
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/whatsapp.png",
                        scale: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Book on whatsapp"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/call.png",
                        scale: 20,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("call and book now"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PreviousOrder(),
          // Previous Order Row Ends
          // Doscount Grid Start
          DiscountGrid(),
          // Doscount Grid Ends
          heightSpace,
          heightSpace,
          shopbycategory(),

          heightSpace,
          heightSpace,

          shop_by_brand(),

          heightSpace,
          heightSpace,
          //Handpicked Item Grid Start
          HandpickedItemGrid(),
          //Handpicked Item Grid Ends
          heightSpace,
          heightSpace,
          // Featured Brands Grid Start

          // Featured Brands Grid End
          // Deal of the day Start
          DealOfTheDayGrid(),
          // Deal of the day End
          heightSpace,
          heightSpace,
          // Top Categories Start
          TopCategoriesGrid(),
          // Top Categories End
          // heightSpace,
          // heightSpace,
          // Need Help Start
          // InkWell(
          //   onTap: () {},
          //   child: getTile(
          //       Icon(Icons.headset_mic, color: primaryColor), 'Need Help?'),
          // ),
          // Need Help End
          heightSpace,
          heightSpace,
          // Rate Us Now Start
          InkWell(
            onTap: () {},
            child:
                getTile(Icon(Icons.star, color: primaryColor), 'Rate us Now'),
          ),
          // Rate Us Now End
          heightSpace,
          heightSpace,

          health_articles(),

          heightSpace,
          heightSpace,

          healthcondition(),

          heightSpace,
          heightSpace,

          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 60),
                child: Text(
                  'Stay home, Stay safe  with Cabento',
                  style: TextStyle(fontSize: 16, color: primaryColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 8),
                child: Icon(
                  Icons.favorite,
                  size: 35,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getTile(Icon icon, String title) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: EdgeInsets.only(right: fixPadding * 2.0, left: fixPadding * 2.0),
      padding: EdgeInsets.all(fixPadding * 1.5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(width: 0.4, color: primaryColor.withOpacity(0.6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          widthSpace,
          Text(title, style: primaryColorHeadingStyle),
        ],
      ),
    );
  }
}
