// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class shop_by_brand extends StatefulWidget {
  const shop_by_brand({Key key}) : super(key: key);

  @override
  State<shop_by_brand> createState() => _shop_by_brandState();
}

class _shop_by_brandState extends State<shop_by_brand> {
  var data, baseUrl;
  Future getBrandList() async {
    final response = await http.get(
      Uri.parse("https://fusionclient.live/FTL190160/cabento/api/brand-list"),
    );
    Map<String, dynamic> map = jsonDecode(response.body.toString());
    data = map["brand_list"];
    baseUrl = map["baseUrl"];
    if (response.statusCode == 200) {
      return data;
    } else {
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBrandList(),
      builder: (context, snapshot) {
        if (data == null) {
          return Center(
            child: null,  
          );
        } else {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    'Shop by brand',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 30.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              Container(
                                child: Image.network(
                                  baseUrl + data[index]["logo"],
                                  height: 81,
                                  fit: BoxFit.fitWidth,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              Text(
                                data[index]["name"].toString(),
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
      },
    );
  }
}
