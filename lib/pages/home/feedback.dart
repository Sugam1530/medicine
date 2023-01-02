// ignore_for_file: camel_case_types

import 'dart:math';

import 'package:cabento/constants/constants.dart';
import 'package:flutter/material.dart';

class feedback extends StatefulWidget {
  const feedback({Key key}) : super(key: key);

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        maxLines: 4,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(          
            borderSide: BorderSide(color: primaryColor, width: 2, ),
          ),
          focusedBorder: OutlineInputBorder(          
            borderSide: BorderSide(color: primaryColor, width: 2, ),
          ),
          labelText: 'Give Your Feedback',
        ),
      ),
    );
  }
}
