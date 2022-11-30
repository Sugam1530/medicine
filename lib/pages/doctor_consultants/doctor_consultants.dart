// ignore_for_file: camel_case_types, unused_import, unnecessary_import

import 'dart:ui';

import 'package:cabento/constants/constants.dart';
import 'package:cabento/pages/doctor_consultants/doctor_consult.dart';
import 'package:cabento/pages/home/slider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class doctor_consultants extends StatefulWidget {
  const doctor_consultants({Key key}) : super(key: key);

  @override
  State<doctor_consultants> createState() => _doctor_consultantsState();
}

class _doctor_consultantsState extends State<doctor_consultants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Row(
          children: [Text('Cabento')],
        ),
      ),
      body: Container(
        child: ListView(children: [
          MainSlider(),
          const SizedBox(
            height: 20.0,
          ),
          const Center(
              child: Text(
            "Online Consultation with Quaiflied Doctors",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 28,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Talk Within',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '1 hour',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Icon(
                    Icons.forum_outlined,
                    size: 28,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '2 Days Free',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Follow up',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Icon(
                    CupertinoIcons.doc_plaintext,
                    size: 28,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Get a valid',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Prescription',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: Size(50, 40),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: Doctor_consult(),
                    ),
                  );
                },
                child: Text(
                  'Consult Now',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Offers For you',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              )),
          SizedBox(
            height: 10,
          ),
          MainSlider(),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              'Consultation with one Click',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 200,
                child: Card(
                  elevation: 2,
                  child: Center(
                    child: Text(
                      'High/Low Blood Sugar',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: Card(
                  elevation: 5,
                  child: Center(
                    child: Text('Headache',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: Card(
                  elevation: 2,
                  child: Center(
                    child: Text(
                      'Fever',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: Card(
                  elevation: 2,
                  child: Center(
                    child: Text('Cough',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: Card(
                  elevation: 2,
                  child: Center(
                    child: Text('Sone Thoat',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 200,
                child: Card(
                  elevation: 2,
                  child: Center(
                    child: Text(
                      'High/Low Blood Pressure',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: Card(
                  elevation: 2,
                  child: Center(
                    child: Text('Chest pain',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
