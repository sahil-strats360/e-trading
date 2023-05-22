

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mymoney/screen/home/watchlist/watchlist_screen.dart';

import '../../../utils/app_bar.dart';
import '../../../utils/color.dart';
import '../../../utils/data.dart';
import '../../../utils/utils_text.dart';
import 'home_screen.dart';

class MostActiveAllStocksScreen extends StatelessWidget {
  const MostActiveAllStocksScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDesign(() {}),
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
                      itemCount: mostActiveAllStocksScreenList.length,
                      itemBuilder: (context, index) => 
                        listViewItemDesignMostStock(
                      context: context,
                      image: mostActiveAllStocksScreenList[index]["img"],
                      title: mostActiveAllStocksScreenList[index]["title"],
                      subTitle: mostActiveAllStocksScreenList[index]
                          ["subTitle"],
                      total: mostActiveAllStocksScreenList[index]
                          ["totalRs"],
                      stock1: mostActiveAllStocksScreenList[index]
                          ["stock1"],
                      stock2: mostActiveAllStocksScreenList[index]
                          ["stock2"],
                      colorName: mostActiveAllStocksScreenList[index]
                          ["color"],
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