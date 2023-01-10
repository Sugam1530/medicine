// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class health_articles extends StatefulWidget {
  const health_articles({Key key}) : super(key: key);

  @override
  State<health_articles> createState() => _health_articlesState();
}

class _health_articlesState extends State<health_articles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Health Articles",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "View All >",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int position) {
                return Container(
                  margin: EdgeInsets.only(left: 8),
                  height: 100,
                  width: 100,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Container(
                    // margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/medi.png',
                          scale: 1,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Text(
                              'paracetamol',
                              style: TextStyle(fontSize: 12),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
