import 'package:badges/badges.dart';
import 'package:cabento/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../cart_payment/cart.dart';
import '../choose_location_address/choose_location.dart';
import '../offer/offer.dart';
import '../search/search.dart';

class labtest extends StatefulWidget {
  const labtest({Key key}) : super(key: key);

  @override
  State<labtest> createState() => _labtestState();
}

class _labtestState extends State<labtest> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    child: Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Lab Tests',
                    style: TextStyle(fontSize: 22),
                  ),
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
                    children: [],
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
            icon: Icon(Icons.person),
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
                      'Sample Pickup from XXXXXX, hroghly',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 240, 177, 162),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Icon(Icons.verified),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'FREE',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    'Honc Sample Collection for new Vies',
                    style: TextStyle(fontSize: 14),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, right: 150),
            child: Text(
              'Brown by Health Concons',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 212, 240, 213),
                      child: Text(
                        'RTPLR',
                        style: TextStyle(color: Colors.black),
                      ),
                      radius: 40,
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            width: 400,
            color: Colors.black,
          ),
          Container(
            margin: EdgeInsets.only(right: 160, top: 10),
            child: Text(
              'Easy way to book a test',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 12),
                height: 55,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 241, 190, 178),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 26, top: 12),
                  child: Text(
                    'Call and Book',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 15),
                height: 55,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 241, 190, 178),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 12,
                  ),
                  child: Text(
                    'Upload Prescription',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 241, 190, 178),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'View all test Available with Cabento',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 150, top: 15),
            child: Text(
              'Powered by THYROCARE',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 10),
                child: Icon(
                  Icons.thumb_up,
                  size: 25,
                  color: Colors.lightBlue,
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 7, top: 25),
                    child: Text(
                      'Doctor Verified',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Text(
                    'Reports',
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 10),
                child: Icon(
                  Icons.batch_prediction,
                  size: 28,
                  color: Colors.lightBlue,
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 7, top: 25),
                    child: Text(
                      '25+ years of',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Text(
                    'experience',
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 26, left: 10),
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.lightBlue,
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 7, top: 25),
                    child: Text(
                      'Safe home sample',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Text(
                    'collection',
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, left: 60),
            child: Text(
              'Stay home,Stay safe  with Cabento',
              style: TextStyle(fontSize: 16, color: primaryColor),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 30, left: 8),
              child: Icon(
                Icons.favorite,
                size: 35,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
