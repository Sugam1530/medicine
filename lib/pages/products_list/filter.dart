import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool price1 = false,
      price2 = false,
      price3 = false,
      brand1 = false,
      brand2 = false,
      brand3 = false;
  bool occasion1 = false, occasion2 = false, occasion3 = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Text('Filter', style: appBarTitleStyle),
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          width: width,
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: width - fixPadding * 4.0,
                height: 50.0,
                child: ElevatedButton(
                  child: Text(
                    'Apply',
                    style: appBarTitleStyle,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
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
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
              child: Text(
                'Discount',
                style: primaryColorHeadingStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              height: 1.0,
            ),
            checkbox("10% and above", price1),
            checkbox("20% and above", price2),
            checkbox("30% and above", price3),
            SizedBox(
              height: 8.0,
            ),
            Divider(
              height: 1.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
              child: Text(
                'Brand',
                style: primaryColorHeadingStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              height: 1.0,
            ),
            checkbox("HealthVit", brand1),
            checkbox("Garlico Herbal", brand2),
            checkbox("Organic Wellness", brand3),
            SizedBox(
              height: 8.0,
            ),
            Divider(
              height: 1.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
              child: Text(
                'Product Form',
                style: primaryColorHeadingStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              height: 1.0,
            ),
            checkbox("Capsule", occasion1),
            checkbox("Powder", occasion2),
            checkbox("Tablet", occasion3),
          ],
        ),
      ),
    );
  }

  Widget checkbox(String title, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: boolValue,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (bool value) {
            setState(() {
              switch (title) {
                case "10% and above":
                  price1 = value;
                  break;

                case "20% and above":
                  price2 = value;
                  break;

                case "30% and above":
                  price3 = value;
                  break;

                case "HealthVit":
                  brand1 = value;
                  break;

                case "Garlico Herbal":
                  brand2 = value;
                  break;

                case "Organic Wellness":
                  brand3 = value;
                  break;

                case "Capsule":
                  occasion1 = value;
                  break;

                case "Powder":
                  occasion2 = value;
                  break;

                case "Tablet":
                  occasion3 = value;
                  break;
              }
            });
          },
        ),
        Text(title, style: subHeadingStyle),
      ],
    );
  }
}
