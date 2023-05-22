import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/controller/tabcontroller_screen.dart';
import 'package:mymoney/screen/home/order/pending_screen.dart';
import 'package:mymoney/screen/home/watchlist/home_screen.dart';
import 'package:mymoney/utils/color.dart';

import '../../../utils/app_bar.dart';

// ignore: must_be_immutable
class OrderScreen extends StatefulWidget {
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  MyTabController myTabController = Get.put(MyTabController());
  String search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      resizeToAvoidBottomInset: false,
      appBar: appBarDesign((String searching) {
        setState(() {
          search = searching;
        });
      }),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: BottomAppBar(
              color: pageBackGroundC,
              elevation: 0,
              child: Center(
                child: TabBar(
                  labelColor: kPrimaryColorPink,
                  controller: myTabController.controller1,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: kPrimaryColorPink,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2,
                  isScrollable: false,
                  indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(color: kPrimaryColororangetoPink, width: 2),
                    // insets: EdgeInsets.only(bottom: 52),
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
            ),
          ),
          Container(
            height: Get.height > 891
                ? Get.height / 1.3
                : Get.height / 1.5 /* tablet:Get.height / 1.34*/,
            /*601*/
            color: white,
            child: TabBarView(
              controller: myTabController.controller1,
              children: [
                PendingOrderScreen(),
                // ExecutedScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
