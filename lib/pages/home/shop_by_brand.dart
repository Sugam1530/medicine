import 'package:flutter/material.dart';

class shop_by_brand extends StatefulWidget {
  const shop_by_brand({Key key}) : super(key: key);

  @override
  State<shop_by_brand> createState() => _shop_by_brandState();
}

class _shop_by_brandState extends State<shop_by_brand> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left:15,
            ),
            child: Text(
              'Shop by brand',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 30.0),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    child: Container(
                      height: 110,
                      width: 110,
                      child: Center(
                        child: Text(
                          'Dabur',
                          style: TextStyle(fontSize: 20),
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
