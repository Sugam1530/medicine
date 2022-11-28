import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';
import 'package:timeline/model/timeline_model.dart';
import 'package:timeline/timeline.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  final List<TimelineModel> list = [
    TimelineModel(id: "1", description: "21 Aug, 2020", title: "Order Accept"),
    TimelineModel(id: "2", description: "21 Aug, 2020", title: "Order Packed"),
    TimelineModel(
        id: "2", description: "22 Aug, 2020", title: "Order Dispatch"),
    TimelineModel(
        id: "2",
        description: "24 Aug, 2020",
        title: "Order Arriving at cabento Fulfilment Center")
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Text('Track Order', style: appBarTitleStyle),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(140.0),
          child: Container(
            padding: EdgeInsets.all(fixPadding * 2.0),
            color: scaffoldBgColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  color: whiteColor,
                  child: Image.asset(
                      'assets/deal_of_the_day/deal_of_the_day_2.png',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.fitHeight),
                ),
                widthSpace,
                Container(
                  width: width - (fixPadding * 4.0 + 100.0 + 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Garlic Pearls - Natural Way To Heathy Heart & Digestion - 100s',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: primaryColorHeadingStyle),
                      heightSpace,
                      Text('Arriving: 29 Aug, 2020',
                          style: greyNormalTextStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TimelineComponent(
        timelineList: list,
        // lineColor: Colors.red[200], // Defaults to accent color if not provided
        // backgroundColor: Colors.black87, // Defaults to white if not provided
        headingColor: primaryColor,
        // Defaults to black if not provided
        // descriptionColor: Colors.grey, // Defaults to grey if not provided
      ),
    );
  }
}
