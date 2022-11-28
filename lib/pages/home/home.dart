import 'package:badges/badges.dart';
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
import 'package:page_transition/page_transition.dart';

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
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'cabento',
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
      body: ListView(
        children: [
          // Main Slider Start
          MainSlider(),
          // Main Slider Ends
          // Previous Order Row Start
          PreviousOrder(),
          // Previous Order Row Ends
          // Doscount Grid Start
          DiscountGrid(),
          // Doscount Grid Ends
          heightSpace,
          heightSpace,
          //Handpicked Item Grid Start
          HandpickedItemGrid(),
          //Handpicked Item Grid Ends
          heightSpace,
          heightSpace,
          // Featured Brands Grid Start
          FeaturedBrandGrid(),
          // Featured Brands Grid End
          heightSpace,
          heightSpace,
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
