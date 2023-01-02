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
              ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text("data"),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
