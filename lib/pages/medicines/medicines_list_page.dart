import 'dart:convert';

import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/choose_location_address/choose_location.dart';
import 'package:cabento/pages/search/search.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

import '../offer/offer.dart';

class medicines_page extends StatefulWidget {
  const medicines_page({Key key}) : super(key: key);

  @override
  State<medicines_page> createState() => _medicines_pageState();
}

class _medicines_pageState extends State<medicines_page> {
  var baseUrl;
  List<String> icon = [];

  var map, data;
  Future getApi() async {
    final responce = await http.get(Uri.parse(
        'https://fusionclient.live/FTL190160/cabento/api/medicine-list'));

    map = jsonDecode(responce.body.toString());
    data = map["medicine_list"];
    baseUrl = map["baseUrl"];

    if (responce.statusCode == 200) {
      return data;
    } else {
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      'Medicines',
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
              // width: width,
              padding: EdgeInsets.all(fixPadding),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Search()));
                },
                child: Container(
                  //  width: width - fixPadding * 2.0,
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
        body: FutureBuilder(
            future: getApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 232, 186, 80),
                  ),
                );
              } else {
                return GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 210,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(left: 2, top: 8),
                          width: 150.0,
                          height: 260.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),

                            // image: DecorationImage(
                            //   image: AssetImage('assets/nd-cold.png'),
                            //   fit: BoxFit.fitHeight,
                            // ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                child: Image.network(
                                  baseUrl + data[index]['product_image'],
                                ),
                              ),
                              Text(
                                data[index]['product_name'],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      data[index]['product_price'] != null
                                          ? "Rs:-" +
                                              data[index]['product_price']
                                          : 'RS:-' + "20.3",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: Text(
                                      'Rs:- 44.6/-',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 206, 183, 111)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: Text(
                                      '2 % off',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),  
                              SizedBox(
                                width: 90,
                                height: 30,
                                child: ElevatedButton(
                                  child: Text(
                                    'add to card',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 27, 134, 30),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
            }));
  }
}
