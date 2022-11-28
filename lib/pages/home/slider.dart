import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';

class MainSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          Image.asset('assets/slider/slider_1.jpg', fit: BoxFit.cover),
          Image.asset('assets/slider/slider_2.jpg', fit: BoxFit.cover),
          Image.asset('assets/slider/slider_3.jpg', fit: BoxFit.cover),
        ],
      ),
    );
  }
}
