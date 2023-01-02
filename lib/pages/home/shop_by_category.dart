// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class shopbycategory extends StatefulWidget {
  const shopbycategory({Key key}) : super(key: key);

  @override
  State<shopbycategory> createState() => _shopbycategoryState();
}

class _shopbycategoryState extends State<shopbycategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  'Shop by Category',
                  style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 80,
                ),
                child: Text(
                  'View all',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
              Icon(Icons.arrow_right),
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
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/doctor.jpg',
                            height: 81,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Text(
                          'Lab Tests',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
