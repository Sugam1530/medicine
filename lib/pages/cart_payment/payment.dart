import 'package:flutter/material.dart';
import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/bottom_bar.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool amazon = true,
      card = false,
      paypal = false,
      skrill = false,
      cashOn = false;

  successOrderDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 170.0,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 70.0,
                  width: 70.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    border: Border.all(color: primaryColor, width: 1.0),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 40.0,
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Your order has been placed!",
                  style: orderPlacedTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomBar()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Text('Choose Payment Option', style: appBarTitleStyle),
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
                    'Pay',
                    style: appBarTitleStyle,
                  ),
                  onPressed: () {
                    successOrderDialog();
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
          getPaymentTile(
              'Pay on Delivery', 'assets/payment_icon/cash_on_delivery.png'),
          getPaymentTile('Amazon Pay', 'assets/payment_icon/amazon_pay.png'),
          getPaymentTile('Card', 'assets/payment_icon/card.png'),
          getPaymentTile('PayPal', 'assets/payment_icon/paypal.png'),
          getPaymentTile('Skrill', 'assets/payment_icon/skrill.png'),
          Container(height: fixPadding * 2.0),
        ],
      ),
    );
  }

  getPaymentTile(String title, String imgPath) {
    return InkWell(
      onTap: () {
        if (title == 'Pay on Delivery') {
          setState(() {
            cashOn = true;
            amazon = false;
            card = false;
            paypal = false;
            skrill = false;
          });
        } else if (title == 'Amazon Pay') {
          setState(() {
            cashOn = false;
            amazon = true;
            card = false;
            paypal = false;
            skrill = false;
          });
        } else if (title == 'Card') {
          setState(() {
            cashOn = false;
            amazon = false;
            card = true;
            paypal = false;
            skrill = false;
          });
        } else if (title == 'PayPal') {
          setState(() {
            cashOn = false;
            amazon = false;
            card = false;
            paypal = true;
            skrill = false;
          });
        } else if (title == 'Skrill') {
          setState(() {
            cashOn = false;
            amazon = false;
            card = false;
            paypal = false;
            skrill = true;
          });
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            right: fixPadding * 2.0,
            left: fixPadding * 2.0,
            top: fixPadding * 2.0),
        padding: EdgeInsets.all(fixPadding * 2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(
            width: 1.0,
            color: (title == 'Pay on Delivery')
                ? (cashOn)
                    ? primaryColor
                    : Colors.grey[300]
                : (title == 'Amazon Pay')
                    ? (amazon)
                        ? primaryColor
                        : Colors.grey[300]
                    : (title == 'Card')
                        ? (card)
                            ? primaryColor
                            : Colors.grey[300]
                        : (title == 'PayPal')
                            ? (paypal)
                                ? primaryColor
                                : Colors.grey[300]
                            : (skrill)
                                ? primaryColor
                                : Colors.grey[300],
          ),
          color: whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70.0,
                  child:
                      Image.asset(imgPath, width: 70.0, fit: BoxFit.fitWidth),
                ),
                widthSpace,
                Text(title, style: primaryColorHeadingStyle),
              ],
            ),
            Container(
              width: 20.0,
              height: 20.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  width: 1.5,
                  color: (title == 'Pay on Delivery')
                      ? (cashOn)
                          ? primaryColor
                          : Colors.grey[300]
                      : (title == 'Amazon Pay')
                          ? (amazon)
                              ? primaryColor
                              : Colors.grey[300]
                          : (title == 'Card')
                              ? (card)
                                  ? primaryColor
                                  : Colors.grey[300]
                              : (title == 'PayPal')
                                  ? (paypal)
                                      ? primaryColor
                                      : Colors.grey[300]
                                  : (skrill)
                                      ? primaryColor
                                      : Colors.grey[300],
                ),
              ),
              child: Container(
                width: 10.0,
                height: 10.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: (title == 'Pay on Delivery')
                      ? (cashOn)
                          ? primaryColor
                          : Colors.transparent
                      : (title == 'Amazon Pay')
                          ? (amazon)
                              ? primaryColor
                              : Colors.transparent
                          : (title == 'Card')
                              ? (card)
                                  ? primaryColor
                                  : Colors.transparent
                              : (title == 'PayPal')
                                  ? (paypal)
                                      ? primaryColor
                                      : Colors.transparent
                                  : (skrill)
                                      ? primaryColor
                                      : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
