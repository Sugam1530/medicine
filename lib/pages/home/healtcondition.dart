// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class healthcondition extends StatefulWidget {
  const healthcondition({Key key}) : super(key: key);

  @override
  State<healthcondition> createState() => _healthconditionState();
}

class _healthconditionState extends State<healthcondition> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20,),
                child: Text(
                  'Shop by Health Condition',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 30.0),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 8,
                    child: Container(
                      height: 110,
                      width: 110,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18, top: 15),
                        child: Text(
                          'Kidney Care',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
