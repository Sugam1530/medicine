import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/products_list/product_list.dart';
import 'package:page_transition/page_transition.dart';

class FeaturedBrandGrid extends StatefulWidget {
  @override
  _FeaturedBrandGridState createState() => _FeaturedBrandGridState();
}

class _FeaturedBrandGridState extends State<FeaturedBrandGrid> {
  final featuredBrandList = [
    {
      'brandId': 1,
      'image': 'assets/featured_brands/featured_brands_1.jpg',
      'name': 'Liveasy'
    },
    {
      'brandId': 2,
      'image': 'assets/featured_brands/featured_brands_2.jpg',
      'name': 'Complan'
    },
    {
      'brandId': 3,
      'image': 'assets/featured_brands/featured_brands_3.jpg',
      'name': 'Dettol'
    },
    {
      'brandId': 4,
      'image': 'assets/featured_brands/featured_brands_4.jpg',
      'name': 'Emami'
    },
    {
      'brandId': 5,
      'image': 'assets/featured_brands/featured_brands_5.jpg',
      'name': 'Marico'
    },
    {
      'brandId': 6,
      'image': 'assets/featured_brands/featured_brands_6.jpg',
      'name': 'Protinex'
    },
    {
      'brandId': 7,
      'image': 'assets/featured_brands/featured_brands_7.jpg',
      'name': 'Volini'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      color: whiteColor,
      padding: EdgeInsets.only(top: fixPadding * 2.0, bottom: fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: fixPadding * 2.5),
            child: Text(
              'Featured Brands',
              style: blackHeadingStyle,
            ),
          ),
          heightSpace,
          getItemGrid(),
        ],
      ),
    );
  }

  getItemGrid() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 220.0,
      child: ListView.builder(
        itemCount: featuredBrandList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = featuredBrandList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ProductList()));
            },
            child: Container(
              width: 150.0,
              margin: (index == (featuredBrandList.length - 1))
                  ? EdgeInsets.only(left: 20.0, right: 20.0)
                  : EdgeInsets.only(left: 20.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      width: 0.6, color: primaryColor.withOpacity(0.6)),
                  image: DecorationImage(
                    image: AssetImage(item['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
