import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/controller/tabcontroller_screen.dart';
import 'package:mymoney/screen/home/portfolio/equity/bookedPL.dart';
import 'package:mymoney/utils/color.dart';

import 'current_screen.dart';
import 'holding_screen.dart';

// ignore: must_be_immutable
class EquityScreen extends StatefulWidget {
  String search;
  EquityScreen(String searchtext) {
    search = searchtext;
  }

  @override
  State<EquityScreen> createState() => _EquityScreenState();
}

class _EquityScreenState extends State<EquityScreen> {
  MyTabController myTabController = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        AppBar(
          foregroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: white,
          title: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: grayE7E8EB,
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: TabBar(
                // automaticIndicatorColorAdjustment: false,
                // labelPadding: EdgeInsets.all(15),
                // onTap: _onItemTapped,
                labelColor: white,
                controller: myTabController.controller4,
                unselectedLabelColor: Colors.grey,
                // indicatorColor: appColor,

                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2,
                // isScrollable: false,
                physics: NeverScrollableScrollPhysics(),
                // labelPadding: EdgeInsets.only(right: 40),
                indicator: BoxDecoration(
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0.1, 0.3, 0.7, 0.8],
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
                      kPrimaryColorOrange,
                      kPrimaryColororangePink,
                      kPrimaryColororangetoPink,
                      kPrimaryColorPink,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff40000000).withOpacity(0.1),
                      offset: Offset(0.5, 3),
                      blurRadius: 5,
                      spreadRadius: 0.2,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: pageBackGroundC,
                ),
                tabs: myTabController.myTabs4,
                labelStyle: TextStyle(
                  fontSize: 12,
                  color: black2,
                  fontFamily: "PoppinsMedium",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: myTabController.controller4,
            children: [
              CurrentScreen(widget.search),
              HoldingScreen(widget.search),
              BookedPLScreen(widget.search),
            ],
          ),
        ),
        SizedBox(
          height: height / 6.1,
        )
      ],
    );
  }
}
