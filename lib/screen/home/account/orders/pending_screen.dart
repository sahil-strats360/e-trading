import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/color.dart';
import '../../../../utils/data.dart';
import '../../../../utils/imagenames.dart';
import '../../../../utils/utils_text.dart';

class PendingScreen extends StatelessWidget {
  List _foundList = [];

  PendingScreen(String search) {
    if (search == null) {
      _foundList = pendingListPageBuildDesign;
    } else {
      _foundList = pendingListPageBuildDesign
          .where((element) =>
              element['bankName'].toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return pendingListPageBuildDesign.isEmpty
        ? Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(benner1oderscreen,
                height: Get.height / 4.22,
              ),
              Text(
                "You Have Not Placed Any Orders!",
                style: TextStyle(
                  fontSize: 15,
                  color: black,
                  fontFamily: "NunitoSemiBold",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Go to Watchlist",
                style: TextStyle(
                  fontSize: 15,
                  color: appColor,
                  fontFamily: "NunitoBold",
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          )
        : ScrollConfiguration(
            behavior: MyBehavior(),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _foundList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: index == _foundList.length - 1 ? 150 : 0),
                        child: pendingListDesign(
                          con1Color: _foundList[index]["con1Color"],
                          con2Color: _foundList[index]["con2Color"],
                          image: _foundList[index]["img"],
                          bankName: _foundList[index]["bankName"],
                          orderPrice: _foundList[index]["orderPrice"],
                          con1Text: _foundList[index]["con1Text"],
                          con2Text: _foundList[index]["con2Text"],
                          ltp: _foundList[index]["ltp"],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}

pendingListDesign({
  String image,
  Color con1Color,
  String con1Text,
  String bankName,
  String orderPrice,
  Color con2Color,
  String con2Text,
  String ltp,
}) {
  return Container(
    margin: EdgeInsets.only(
      left: 12,
      right: 12,
      bottom: 9,
      top: 9,
    ),
    padding: EdgeInsets.only(
      left: 11,
      right: 6,
      bottom: 12,
      top: 9,
    ),
    width: Get.width,
    decoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade100,
          spreadRadius: 0.1,
          blurRadius: 8,
          offset: Offset(0.5, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              height: 16,
              width: 46,
              decoration: BoxDecoration(
                color: con1Color,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  con1Text,
                  style: TextStyle(
                    fontSize: 8,
                    color: white,
                    // fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 6,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Qty: ",
                    style: TextStyle(
                      fontSize: 8,
                      color: black.withOpacity(0.3),
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "1",
                    style: TextStyle(
                      fontSize: 8,
                      color: black.withOpacity(0.3),
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              "1 Min ago",
              style: TextStyle(
                fontSize: 8,
                color: black.withOpacity(0.3),
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Container(
              height: 18,
              width: 52,
              decoration: BoxDecoration(
                color: con2Color,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  con2Text,
                  style: TextStyle(
                    fontSize: 8,
                    color: white,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        //-----------------------------------------------------------
        Divider(),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 0.1,
                    blurRadius: 8,
                  ),
                ],
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.fitWidth,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //-------------------------------bankname-----------
                  bankName,
                  style: TextStyle(
                    fontSize: 12,
                    color: black,
                    // fontFamily: "NunitoSemiBold",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "NSE REG LIMIT",
                  style: TextStyle(
                    fontSize: 10,
                    color: black.withOpacity(0.3),
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Order Price",
                  style: TextStyle(
                    fontSize: 12,
                    color: black.withOpacity(0.3),
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  orderPrice,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.deepOrange,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  "LTP",
                  style: TextStyle(
                    fontSize: 12,
                    color: black.withOpacity(0.3),
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ltp,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.deepOrange,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
