// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/product/product.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class single_category extends StatefulWidget {
  const single_category({Key key, this.id}) : super(key: key);

  final String id;

  @override
  State<single_category> createState() => _single_categoryState();
}

class _single_categoryState extends State<single_category> {
  var map, data, baseUrl;
  final handpickedItemList = [
    {
      'itemId': 1,
      'image': 'assets/handpicked_item/handpicked_item_1.png',
      'name':
          'Liveasy Wellness Multivitamin Multimineral - Added Ginseng, Grapeseed & Ginkgo Biloba Extracts - Strong Immunity- 60 Tablets',
      'qty': '60 Tablet(s) in Bottle',
      'oldPrice': '12',
      'price': '6',
      'offer': '50% OFF',
      'companyName': 'LivEasy',
      'imageList': [
        'assets/handpicked_item/handpicked_item_1.png',
        'assets/handpicked_item/handpicked_item_1.png',
        'assets/handpicked_item/handpicked_item_1.png'
      ],
      'flavour': [],
      'selectedFlavour': '',
      'packSize': [],
      'selectedPackSize': '',
      'manufacturer': 'Zeon Lifesciences Limited',
      'countryOfOrigin': 'India'
    },
    {
      'itemId': 2,
      'image': 'assets/handpicked_item/handpicked_item_2.png',
      'name': 'Liveasy Women Multi-vitamin Tablets Bottle Of 60',
      'qty': '60 Tablet(s) in Bottle',
      'oldPrice': '13',
      'price': '8',
      'offer': '30% OFF',
      'companyName': 'LivEasy',
      'imageList': [
        'assets/handpicked_item/handpicked_item_2.png',
        'assets/handpicked_item/handpicked_item_2.png',
        'assets/handpicked_item/handpicked_item_2.png'
      ],
      'flavour': [],
      'selectedFlavour': '',
      'packSize': [],
      'selectedPackSize': '',
      'manufacturer': 'Zeon Lifesciences Limited',
      'countryOfOrigin': 'India'
    },
    {
      'itemId': 3,
      'image': 'assets/handpicked_item/handpicked_item_3.png',
      'name':
          'Liveasy Wellness Calcium, Magnesium, Vitamin D3 & Zinc - Strong Bones & Dental Health - 60 Tablets',
      'qty': '60 Tablet(s) in Bottle',
      'oldPrice': '15',
      'price': '7',
      'offer': '55% OFF',
      'companyName': 'LivEasy',
      'imageList': [
        'assets/handpicked_item/handpicked_item_3.png',
        'assets/handpicked_item/handpicked_item_3.png',
        'assets/handpicked_item/handpicked_item_3.png'
      ],
      'flavour': [],
      'selectedFlavour': '',
      'packSize': [],
      'selectedPackSize': '',
      'manufacturer': 'Zeon Lifesciences Limited',
      'countryOfOrigin': 'India'
    },
    {
      'itemId': 4,
      'image': 'assets/handpicked_item/handpicked_item_4.png',
      'name':
          'Everherb Moringa (drumsticks) 500mg - 2x Potency - Natural Multivitamin - Immunity Booster - 60 Capsules',
      'qty': '60 Capsule(s) in Bottle',
      'oldPrice': '6',
      'price': '4',
      'offer': '20% OFF',
      'companyName': 'EverHerb',
      'imageList': [
        'assets/handpicked_item/handpicked_item_4.png',
        'assets/handpicked_item/handpicked_item_4.png',
        'assets/handpicked_item/handpicked_item_4.png'
      ],
      'flavour': [],
      'selectedFlavour': '',
      'packSize': [],
      'selectedPackSize': '',
      'manufacturer': 'Bacfo Pharmaceuticals (india) Ltd',
      'countryOfOrigin': 'India'
    },
    {
      'itemId': 5,
      'image': 'assets/handpicked_item/handpicked_item_5.png',
      'name': 'Revital H - Daily Health Supplement - 30 Capsules',
      'qty': '30 Capsules(s) in Bottle',
      'oldPrice': '5',
      'price': '4',
      'offer': '10% OFF',
      'companyName': 'REVITAL',
      'imageList': [
        'assets/handpicked_item/handpicked_item_5.png',
        'assets/handpicked_item/handpicked_item_5.png',
        'assets/handpicked_item/handpicked_item_5.png'
      ],
      'flavour': [],
      'selectedFlavour': '',
      'packSize': ['10 NO\'s', '30 NO\'s', '60 NO\'s'],
      'selectedPackSize': '10 NO\'s',
      'manufacturer': 'Sun Pharma',
      'countryOfOrigin': 'India'
    }
  ];
  postSingleCategory(
    String category_id,
  ) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
              'https://fusionclient.live/FTL190160/cabento/api/shop-by-category'),
          body: {
            'category_id': category_id,
          });

      map = jsonDecode(response.body.toString());
      data = map["product_list"];
      baseUrl = map["baseUrl"];

      if (response.statusCode == 200) {
        return data;
        // ignore: use_build_context_synchronously
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Container(
          height: 50,
          child: Image.asset(
            'assets/icon.png',
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: postSingleCategory(widget.id.toString()),
        builder: (context, snapshot) {
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4 / 10,
                  crossAxisCount: 3,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 0.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final item = handpickedItemList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Product(productDetails: data[index])));
                    },
                    child: Container(
                      width: 180.0,
                      margin: (index == (data.length))
                          ? EdgeInsets.only(left: 20.0, right: 20.0)
                          : EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              Hero(
                                tag: '${data[index]['image']}',
                                child: Container(
                                  margin: EdgeInsets.only(right: 15),
                                  width: 170.0,
                                  height: 170.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        width: 0.6,
                                        color: primaryColor.withOpacity(0.6)),
                                  ),
                                  child: Container(
                                    width: 130.0,
                                    height: 130.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            data[index]["image"]),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.9),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Text("50% off",
                                      style: thickWhiteTextStyle),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.0),
                          Container(
                            width: 170.0,
                            height: 100.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index]['name'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: blackHeadingStyle,
                                ),
                                SizedBox(height: 3.0),
                                Text(
                                  data[index]['name'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: subHeadingStyle,
                                ),
                                SizedBox(height: 3.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\₹${data[index]['price']}',
                                      style: priceStyle,
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      '\₹${data[index]['price']}',
                                      style: oldStyle,
                                    ),
                                  ],
                                ),
                              ],
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
        },
      ),
    );
  }
}
