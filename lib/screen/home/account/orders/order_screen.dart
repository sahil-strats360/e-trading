import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mymoney/screen/home/account/orders/executed_screen.dart';
import 'package:mymoney/screen/home/account/orders/pending_screen.dart';

import '../../../../utils/app_bar.dart';
import '../../../../utils/color.dart';
import '../../watchlist/buy_sell_screen.dart';
import '../../watchlist/home_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      resizeToAvoidBottomInset: false,
      appBar: appBarDesign((String searchText) {
        setState(() {
          search = searchText;
        });
      }),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            //color: pageBackGroundC,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0.1, 0.3, 0.7, 0.8],
                colors: [
                  kPrimaryColorOrange,
                  kPrimaryColororangePink,
                  kPrimaryColororangetoPink,
                  kPrimaryColorPink,
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(22),
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: TabBar(
                    labelColor: Colors.white,
                    controller: myTabController.controller1,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: kPrimaryColorPink,
                    indicatorPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    indicatorWeight: 2,
                    isScrollable: false,
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
                          color: kPrimaryColororangePink.withOpacity(0.1),
                          offset: Offset(0.5, 3),
                          blurRadius: 5,
                          spreadRadius: 0.2,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: kPrimaryColororangetoPink,
                    ),
                    tabs: myTabController.myTabs2,
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: black2,
                      fontFamily: "NunitoSemiBold",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 110,
            child: Container(
              width: Get.width,
              height: Get.height / 1.14,
              decoration: BoxDecoration(
                color: grayF2F2F2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TabBarView(
                controller: myTabController.controller1,
                children: [
                  PendingScreen(search),
                  ExecutedScreen(search),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
