import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/search/previously_purchased_item.dart';
import 'package:cabento/pages/search/recently_search_item.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Container(
          width: width - 70.0,
          height: 43.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: TextField(
            style: searchTextStyle,
            decoration: InputDecoration(
              hintText: 'Search Medicines/healthcare products',
              hintStyle: searchTextStyle,
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.all(5.0),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // Recently Search Item Start
          RecentlySearchItem(),
          // Recently Search Item End
          heightSpace,
          // Previously Purchased Item Start
          PreviouslyPurchasedItem(),
          // Previously Purchased Item End
        ],
      ),
    );
  }
}
