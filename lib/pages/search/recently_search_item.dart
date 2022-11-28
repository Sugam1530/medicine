import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';

class RecentlySearchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: scaffoldBgColor,
      padding: EdgeInsets.all(fixPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recently Search Item', style: subHeadingStyle),
          heightSpace,
          Wrap(
            children: <Widget>[
              getSearchSuggestionTile('Dexlansoprazole'),
              getSearchSuggestionTile('Logidrud'),
              getSearchSuggestionTile('Ecosprin 75'),
              getSearchSuggestionTile('Dytor p'),
              getSearchSuggestionTile('Revital h'),
              getSearchSuggestionTile('Peracitamol'),
            ],
          ),
        ],
      ),
    );
  }

  getSearchSuggestionTile(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: primaryColor,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
