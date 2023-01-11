import 'package:badges/badges.dart';
import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/cart_payment/cart.dart';
import 'package:cabento/pages/choose_location_address/choose_location.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import '../search/search.dart';

class product_list extends StatefulWidget {
  const product_list({Key key}) : super(key: key);

  @override
  State<product_list> createState() => _product_listState();
}

class _product_listState extends State<product_list> {
  

  int current = 0;
  String selectedFlavour, selectedPackSize;
  int cartItem = 1;
  int selectedQty = 0;
  bool addedToCart = false;

  @override
  void initState() {
    super.initState();
    // selectedFlavour = widget.productDetails['selectedFlavour'];
    // selectedPackSize = widget.productDetails['selectedPackSize'];
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  selectQtyDialogue() {
    double width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.only(
                    right: fixPadding * 1.5,
                    left: fixPadding * 1.5,
                    top: fixPadding,
                    bottom: fixPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select Quantity', style: primaryColorBigHeadingStyle),
                    widthSpace,
                    IconButton(
                      icon: Icon(Icons.close, color: primaryColor),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                height: 0.6,
                color: primaryColor,
              ),

              (addedToCart)
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          addedToCart = false;
                          selectedQty = 0;
                          cartItem = cartItem - 1;
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        width: width,
                        padding: EdgeInsets.all(fixPadding * 1.5),
                        color: Colors.transparent,
                        child: Text('Remove item',
                            style: primaryColorHeadingStyle),
                      ),
                    )
                  : Container(),
              // 1
              InkWell(
                onTap: () {
                  setState(() {
                    selectedQty = 1;
                    if (!addedToCart) {
                      cartItem = cartItem + 1;
                    }
                    addedToCart = true;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: width,
                  padding: EdgeInsets.all(fixPadding * 1.5),
                  color:
                      (selectedQty == 1) ? lightGreyColor : Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('1', style: primaryColorHeadingStyle),
                      (selectedQty == 1)
                          ? Container(
                              width: 26.0,
                              height: 26.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: redColor),
                              child: Icon(Icons.check,
                                  size: 18.0, color: whiteColor),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),

              // 2
              InkWell(
                onTap: () {
                  setState(() {
                    selectedQty = 2;
                    if (!addedToCart) {
                      cartItem = cartItem + 1;
                    }
                    addedToCart = true;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: width,
                  padding: EdgeInsets.all(fixPadding * 1.5),
                  color:
                      (selectedQty == 2) ? lightGreyColor : Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('2', style: primaryColorHeadingStyle),
                      (selectedQty == 2)
                          ? Container(
                              width: 26.0,
                              height: 26.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: redColor),
                              child: Icon(Icons.check,
                                  size: 18.0, color: whiteColor),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),

              // 3
              InkWell(
                onTap: () {
                  setState(() {
                    selectedQty = 3;
                    if (!addedToCart) {
                      cartItem = cartItem + 1;
                    }
                    addedToCart = true;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: width,
                  padding: EdgeInsets.all(fixPadding * 1.5),
                  color:
                      (selectedQty == 3) ? lightGreyColor : Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('3', style: primaryColorHeadingStyle),
                      (selectedQty == 3)
                          ? Container(
                              width: 26.0,
                              height: 26.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: redColor),
                              child: Icon(Icons.check,
                                  size: 18.0, color: whiteColor),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),

              //4
              InkWell(
                onTap: () {
                  setState(() {
                    selectedQty = 4;
                    if (!addedToCart) {
                      cartItem = cartItem + 1;
                    }
                    addedToCart = true;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: width,
                  padding: EdgeInsets.all(fixPadding * 1.5),
                  color:
                      (selectedQty == 4) ? lightGreyColor : Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('4', style: primaryColorHeadingStyle),
                      (selectedQty == 4)
                          ? Container(
                              width: 26.0,
                              height: 26.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: redColor),
                              child: Icon(Icons.check,
                                  size: 18.0, color: whiteColor),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),

              // 5
              InkWell(
                onTap: () {
                  setState(() {
                    selectedQty = 5;
                    if (!addedToCart) {
                      cartItem = cartItem + 1;
                    }
                    addedToCart = true;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: width,
                  padding: EdgeInsets.all(fixPadding * 1.5),
                  color:
                      (selectedQty == 5) ? lightGreyColor : Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('5', style: primaryColorHeadingStyle),
                          widthSpace,
                          Text('Max Qty', style: lightPrimaryColorTextStyle),
                        ],
                      ),
                      (selectedQty == 5)
                          ? Container(
                              width: 26.0,
                              height: 26.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: redColor),
                              child: Icon(Icons.check,
                                  size: 18.0, color: whiteColor),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text('Product Description', style: appBarTitleStyle)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: Search()));
            },
          ),
          IconButton(
            icon: Badge(
              badgeContent: Icon(
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
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          height: 70.0,
          padding:
              EdgeInsets.only(right: fixPadding * 2.0, left: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 90.0,
                child: Text('$cartItem Item in Cart',
                    style: primaryColorHeadingStyle),
              ),
              ButtonTheme(
                height: 50.0,
                child: ElevatedButton(
                  child: Text(
                    'View Cart',
                    style: appBarTitleStyle,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Cart()));
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
          // Deliver To Start
          Container(
            color: scaffoldBgColor,
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, size: 22.0, color: primaryColor),
                    widthSpace,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Deliver To', style: subHeadingStyle),
                        heightSpace,
                        Text('10001 New York', style: primaryColorHeadingStyle),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: ChooseLocation()));
                  },
                  child: Text('Change', style: primaryColorBigHeadingStyle),
                ),
              ],
            ),
          ),
          // Deliver To End

          // // Product Image Section Start
          // productImage(productDetails),
          // // Product Image Section End

          // // Name Price Section Start
          // namePriceSection(),
          // // Name Price Section End

          // greyColorDividerStyle(),

          // // Product Options Section Start
          // productOption(),
          // // Product Options Section End

          // // Description & Key Features Section Start
          // descriptionAndKeyFeatures(),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 100),
            height: 190,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset('assets/dabur.png'),
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                'Liveasy Wellness Multivitamin Multiminera',
                style: TextStyle(fontSize: 18, color: primaryColor),
              )),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'By LivEasy',
              style: TextStyle(fontSize: 16, color: primaryColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              '₹ 6',
              style: TextStyle(
                  fontSize: 18,
                  color: primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  '₹ 12',
                  style: TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 30,
                    width: 60,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        '50% OFF',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 150),
                child: SizedBox(
                  height: 40.0,
                  width: 80,
                  // width: width - (fixPadding * 2.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () async {},
                    child: Text(
                      'Log In',
                      style: whiteTextButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
