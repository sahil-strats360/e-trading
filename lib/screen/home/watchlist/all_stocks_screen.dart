import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/home/watchlist/home_screen.dart';
import 'package:mymoney/screen/home/watchlist/watchlist_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/data.dart';
import 'package:mymoney/utils/utils_text.dart';

import '../../../utils/app_bar.dart';

class AllStockScreen extends StatelessWidget {
String search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDesign((){}),
      backgroundColor: pageBackGroundC,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 23,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 18),
                  child: Text(
                    "All Stocks",
                    style: TextStyle(
                      fontSize: 18,
                      color: black0D1F3C,
                      fontFamily: "NunitoBold",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: allStockScreenList.length,
                      itemBuilder: (context, index) => listViewItemDesign(
                        image: allStockScreenList[index]["img"],
                        title: allStockScreenList[index]["title"],
                        subTitle: allStockScreenList[index]["subTitle"],
                        total: allStockScreenList[index]["totalRs"],
                        stock1: allStockScreenList[index]["stock1"],
                        stock2: allStockScreenList[index]["stock2"],
                        colorName: allStockScreenList[index]["color"],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
