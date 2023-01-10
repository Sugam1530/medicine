// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:cabento/pages/category/single_category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class shopbycategory extends StatefulWidget {
  const shopbycategory({Key key}) : super(key: key);

  @override
  State<shopbycategory> createState() => _shopbycategoryState();
}

class _shopbycategoryState extends State<shopbycategory> {
  var baseUrl;
  List<String> icon = [];

  var map, data;
  Future getApi() async {
    final responce = await http.get(Uri.parse(
        'https://fusionclient.live/FTL190160/cabento/api/category-list'));

    map = jsonDecode(responce.body.toString());
    data = map["category_list"];
    baseUrl = map["baseUrl"];

    if (responce.statusCode == 200) {
      return data;
    } else {
      return data;
    }
  }

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
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
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
          FutureBuilder(
              future: getApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 232, 186, 80),
                    ),
                  );
                } else {
                  return Container(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 30.0),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => single_category(),
                              ));
                            },
                            child: Card(
                              elevation: 8,
                              child: Column(
                                children: [
                                  Container(
                                    child: Image.network(
                                      baseUrl + data[index]['icon'],
                                      height: 81,
                                      fit: BoxFit.fitWidth,
                                      width:
                                          MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                  Text(
                                    data[index]['category_name'],
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
              }),
        ],
      ),
    );
  }
}
