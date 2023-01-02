// ignore_for_file: camel_case_types

// ignore: unused_import
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
      child: SizedBox(
        height: 90,
        child: TextField(
          maxLines: 4,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 2,
                ),
              ),
              labelText: 'Give Your Feedback',
              contentPadding: EdgeInsets.only(left: 30)),
        ),
      ),
    );
  }
}
