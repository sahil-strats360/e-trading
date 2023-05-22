import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

class ResearchScreen extends StatelessWidget {
  const ResearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: pageBackGroundC,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: black1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Research",
          style: TextStyle(
            fontSize: 20,
            color: black2,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        width: Get.width,
        margin: EdgeInsets.only(top: 20, right: 24, left: 24),
        padding: EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          color: pageBackGroundC,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: black.withOpacity(0.15),
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 10),
              child: Row(
                children: [
                  SizedBox(
                    child: SvgPicture.asset(smartInvestor),
                    width: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Smart Investor",
                    style: commonTextStyle(),
                  ),
                ],
              ),
            ),
            commonDivider(),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 10, top: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                    child: SvgPicture.asset(traderSmith),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "TraderSmith",
                    style: commonTextStyle(),
                  ),
                ],
              ),
            ),
            commonDivider(),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 10, top: 10),
              child: Row(
                children: [
                  SizedBox(
                      width: 30, child: SvgPicture.asset(sensibullforoptions)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sensibull for options",
                    style: commonTextStyle(),
                  ),
                ],
              ),
            ),
            commonDivider(),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 10, top: 10),
              child: Row(
                children: [
                  SizedBox(width: 30, child: SvgPicture.asset(marketBuzz)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Market Buzz",
                    style: commonTextStyle(),
                  ),
                ],
              ),
            ),
            commonDivider(),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 10, top: 10),
              child: Row(
                children: [
                  SizedBox(width: 30, child: SvgPicture.asset(screeners)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Screeners",
                    style: commonTextStyle(),
                  ),
                ],
              ),
            ),
            commonDivider(),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 10, top: 10),
              child: Row(
                children: [
                  SizedBox(width: 30, child: SvgPicture.asset(smallcases)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Smallcases",
                    style: commonTextStyle(),
                  ),
                ],
              ),
            ),
            commonDivider(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Row(
                children: [
                  SizedBox(width: 30, child: SvgPicture.asset(news)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "News",
                    style: commonTextStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  commonTextStyle() {
    return TextStyle(
      color: black2,
      fontFamily: "NunitoSemiBold",
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
    );
  }

  commonDivider() {
    return Divider(
      color: gray1,
      height: 1,
      thickness: 1,
    );
  }

  commonSizeBox({var size}) {
    return SizedBox(
      height: size,
    );
  }
}
