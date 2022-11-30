import 'package:cabento/constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Doctor_consult extends StatefulWidget {
  const Doctor_consult({Key key}) : super(key: key);

  @override
  State<Doctor_consult> createState() => _Doctor_consultState();
}

// ignore: camel_case_types
class _Doctor_consultState extends State<Doctor_consult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'cabento',
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(right: 80, top: 9),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Why consult with cabento doctors',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 00),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          //<-- SEE HERE
                          side: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        child: Container(
                          child: Image.asset(
                            'assets/doctor_avatar.jpg',
                          ),
                          height: 110,
                          width: 110,
                        ),
                      ),
                    ),
                    Text('100+ Qualified'),
                    Text('Doctors'),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 60,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          //<-- SEE HERE
                          side: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        child: Container(
                          height: 110,
                          width: 110,
                          child: Image.asset('assets/verified.jpg'),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 60),
                        child: Text('100% Sceure')),
                    Container(
                        margin: EdgeInsets.only(left: 60),
                        child: Text('& Private')),
                  ],
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    'Reach Our doctors',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 160),
                      child: Text('See all>'))
                ],
              )),
          Container(
            height: 220,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 6, top: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        //<-- SEE HERE
                        side: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      child: Container(
                        height: 220,
                        width: 130,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Image.asset(
                              'assets/doctor_avatar.jpg',
                              height: 60,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Dr.Sudip Singh',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              'Qualification: MSC',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              'Reg no. 123345678',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              'Exprience: 5 years',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              margin: EdgeInsets.only(right: 00, top: 20),
              child: Text(
                'Users saying about their exprience',
                style: TextStyle(fontSize: 15),
              )),
          SizedBox(
            height: 12,
          ),
          Container(
            margin: EdgeInsets.only(right: 00),
            child: SizedBox(
              height: 30,
              width: 70,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Article',
                  style: TextStyle(fontSize: 13),
                ),
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 50, bottom: 15),
        child: Row(
          children: [
            Text(
              'Stay Home Stay Safe With Cabento',
              style: TextStyle(color: primaryColor, fontSize: 15),
            ),
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}