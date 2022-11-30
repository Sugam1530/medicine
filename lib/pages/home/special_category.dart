import 'package:cabento/pages/doctor_consultants/doctor_consultants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../labtest/labtest.dart';

class SpecialCategory extends StatefulWidget {
  const SpecialCategory({Key key}) : super(key: key);

  @override
  State<SpecialCategory> createState() => _SpecialCategoryState();
}

class _SpecialCategoryState extends State<SpecialCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/medicines_banner.png",
                scale: 2.2,
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/labtests_banner.png",
                  scale: 2.2,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: labtest(),
                  ),
                );
              },
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/doctor_consultant.png",
                  scale: 2.2,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: doctor_consultants(),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/healthcare_banner.png",
                scale: 2.2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/deals_banner.png",
                scale: 2.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
