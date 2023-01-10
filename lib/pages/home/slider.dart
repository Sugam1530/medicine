import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainSlider extends StatelessWidget {
  var data, baseUrl;
  Future getAllData() async {
    final response = await http.get(
      Uri.parse("https://fusionclient.live/FTL190160/cabento/api/banner-list"),
    );
    Map<String, dynamic> map = jsonDecode(response.body.toString());
    data = map["banners_list"];
    baseUrl = map["baseUrl"];
    // bannerList = map["banners"];
    // adList = map["ad_news"];
    // pdfNewsList = map["pdf_news_category"];
    // dataUrl = (bannerList as List).map((e) => e["image"]).toList();
    // // ignore: unused_local_variable
    // dataList = (dataUrl as List).map((e) => e).cast<String>().toList();
    if (response.statusCode == 200) {
      return data;
    } else {
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: getAllData(),
      builder: (context, snapshot) {
        if (data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox(
            height: height / (width * 0.0115),
            width: width,
            child: Carousel(
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: primaryColor.withOpacity(0.6),
              dotIncreasedColor: primaryColor,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.transparent,
              borderRadius: true,
              dotVerticalPadding: 5.0,
              dotPosition: DotPosition.bottomCenter,
              images: [
                Image.network(baseUrl + data[0]["banner_image"],
                    fit: BoxFit.cover),
                Image.network(baseUrl + data[1]["banner_image"],
                    fit: BoxFit.cover),
                Image.network(baseUrl + data[2]["banner_image"],
                    fit: BoxFit.cover),
              ],
            ),
          );
        }
      },
    );
  }
}
