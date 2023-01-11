import 'dart:io';

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
import 'package:cabento/pages/home/handpicked_item_grid.dart';
import 'package:cabento/pages/home/previous_order_row.dart';
import 'package:cabento/pages/home/slider.dart';
import 'package:cabento/pages/home/top_categories_grid.dart';
import 'package:cabento/pages/offer/offer.dart';
import 'package:cabento/pages/search/search.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'feedback.dart';
import 'health_articles.dart';
import 'healthcondition.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _image;
  Future<void> uploadImageServer1() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    String message;

    // var stream = new http.ByteStream(uploadImage!.openRead());
    // stream.cast();
    var length = await _image.length();
    var uri = Uri.parse(
      "https://fusionclient.live/FTL190160/cabento/api/prescription-upload");
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);

    List<String> photos = [_image.path];

    List<http.MultipartFile> newList = [];

    for (var img in photos) {
      if (img != "") {
        var multipartFile = await http.MultipartFile.fromPath(
          'image',
          File(img).path,
          filename: img.split('/').last,
        );
        newList.add(multipartFile);
      }
    }
    request.files.addAll(newList);

    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {});
      print("Image Uloaded");
      Navigator.of(context, rootNavigator: true).pop('dialog');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Prescription updated successfully"),
      ));
    } else {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Failed to upload photo"),
      ));
      print("Failed");
    }
  }

  Future<File> _cropImage({File imageFile}) async {
    CroppedFile croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  Future getStory(ImageSource media) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    File imageTemporary = File(image.path);
    imageTemporary = await _cropImage(imageFile: imageTemporary);
    setState(() {
      showLoaderDialog(context);
      uploadImageServer1();
      _image = imageTemporary;
    });
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading..."),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
              onPressed: () {
                getStory(ImageSource.gallery);
              },
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
                  onPressed: () {
                    ("https://wa.me/+916290630828?text=Hello");
                  },
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
                  onPressed: () {
                    ('tel://+916290630828');
                  },
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
