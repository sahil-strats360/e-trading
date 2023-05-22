import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/home/watchlist/buy_sell_screen.dart';
import 'package:mymoney/screen/home/watchlist/candel_chart.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BuySellScreen extends StatelessWidget {
  const BuySellScreen({Key key}) : super(key: key);

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
          "AXISBANK",
          style: TextStyle(
            fontSize: 20,
            color: black2,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Image(
            image: AssetImage(AXISBANK),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "Axis Small Cap Fund Direct Growth",
                style: commonTextStyle700(size: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 22),
              child: Row(
                children: [
                  Text(
                    "Very High Risk",
                    style: commonTextStyle400(
                      size: 14.0,
                      color: gray7C828A,
                    ),
                  ),
                  Text(
                    "  \u2022 Equity",
                    style: commonTextStyle400(
                      size: 14.0,
                      color: gray7C828A,
                    ),
                  ),
                  Text(
                    "  \u2022 Small Cap",
                    style: commonTextStyle400(
                      size: 14.0,
                      color: gray7C828A,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 6),
              child: Text(
                "32.00%",
                style: commonTextStyle700(
                  size: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "+0.15%",
                          style: commonTextStyle400(
                            size: 16.0,
                            color: green,
                          ),
                        ),
                        TextSpan(
                          text: "1D",
                          style: commonTextStyle400(
                            size: 14.0,
                            color: gray7C828A,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "3Y annualised",
                    style: commonTextStyle600(
                      size: 14.0,
                      color: gray7C828A,
                    ),
                  )
                ],
              ),
            ),
            commonDivider(height: 1.0, jadai: 3.0),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                "Chart",
                style: commonTextStyle700(
                  size: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width / 1.41,
                    height: 30,
                    child: TabBar(
                      labelColor: appColor,
                      controller: myTabController.controller5,
                      unselectedLabelColor: black,
                      indicatorColor: appColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 2,
                      isScrollable: true,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: transPrent, width: 2),
                        // insets: EdgeInsets.only(bottom: 52),
                      ),
                      tabs: myTabController.myTabs5,
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: black,
                        fontFamily: "NunitoSemiBold",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        if (colorChangeController.graphLine.isTrue ||
                            colorChangeController.graphCandle.isTrue) {
                          colorChangeController.graphLine(false);
                          colorChangeController.graphCandle(false);
                        }
                        colorChangeController.graphLine(true);
                      },
                      child: SvgPicture.asset(
                        colorChangeController.graphLine.isTrue
                            ? graph1
                            : graph1Dark,
                      ),
                    ),
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        if (colorChangeController.graphLine.isTrue ||
                            colorChangeController.graphCandle.isTrue) {
                          colorChangeController.graphLine(false);
                          colorChangeController.graphCandle(false);
                        }
                        colorChangeController.graphCandle(true);
                      },
                      child: SvgPicture.asset(
                          colorChangeController.graphCandle.isTrue
                              ? graph2Light
                              : graph2),
                    ),
                  ),
                  SvgPicture.asset(graph3),
                ],
              ),
            ),
            Container(
              height: 280,
              child: TabBarView(
                controller: myTabController.controller5,
                children: [
                  Obx(
                    () => Container(
                      padding: EdgeInsets.all(8.0),
                      width: Get.width,
                      // height: 280,
                      child: colorChangeController.graphLine.isTrue
                          ? lineGraph()
                          : MyHomePage(),
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding: EdgeInsets.all(8.0),
                      width: Get.width,
                      // height: 280,
                      child: colorChangeController.graphLine.isTrue
                          ? lineGraph()
                          : MyHomePage(),
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding: EdgeInsets.all(8.0),
                      width: Get.width,
                      // height: 280,
                      child: colorChangeController.graphLine.isTrue
                          ? lineGraph()
                          : MyHomePage(),
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding: EdgeInsets.all(8.0),
                      width: Get.width,
                      // height: 280,
                      child: colorChangeController.graphLine.isTrue
                          ? lineGraph()
                          : MyHomePage(),
                    ),
                  ),
                ],
              ),
            ),
            commonDivider(height: 1.0, jadai: 3.0),
            Row(
              children: [
                SizedBox(
                  width: Get.width / 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "NAV: 23-Mar-2022",
                          style: commonTextStyle400(
                            size: 14.0,
                            color: gray7C828A,
                          ),
                        ),
                        Text(
                          "₹ 66.69",
                          style: commonTextStyle700(
                            size: 16.0,
                            color: black2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width / 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rating",
                          style: commonTextStyle400(
                            size: 14.0,
                            color: gray7C828A,
                          ),
                        ),
                        Text(
                          "₹ 66.69",
                          style: commonTextStyle700(
                            size: 16.0,
                            color: black2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width / 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Min. SIP amount",
                          style: commonTextStyle400(
                            size: 14.0,
                            color: gray7C828A,
                          ),
                        ),
                        Text(
                          "₹ 500",
                          style: commonTextStyle700(
                            size: 16.0,
                            color: black2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width / 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fund Size",
                          style: commonTextStyle400(
                            size: 14.0,
                            color: gray7C828A,
                          ),
                        ),
                        Text(
                          "₹ 8,262 Cr",
                          style: commonTextStyle700(
                            size: 16.0,
                            color: black2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            commonDivider(height: 1.0, jadai: 3.0),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Text(
                "Monthly orders trend",
                style: commonTextStyle700(size: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SIP orders",
                    style: commonTextStyle400(
                      size: 14.0,
                      color: gray7C828A,
                    ),
                  ),
                  Text(
                    "One-time orders",
                    style: commonTextStyle400(
                      size: 14.0,
                      color: gray7C828A,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 6, left: 15, right: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "84.7%",
                    style: commonTextStyle700(
                      size: 16.0,
                    ),
                  ),
                  Text(
                    "15.3%",
                    style: commonTextStyle700(
                      size: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new LinearPercentIndicator(
                    width: Get.width,
                    animation: true,
                    lineHeight: 5.0,
                    // animationDuration: 1000,
                    percent: 0.8,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: appColor,
                    addAutomaticKeepAlive: true,
                  ),
                ],
              ),
            ),
            commonDivider(height: 1.0, jadai: 3.0),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recently viewed",
                    style: commonTextStyle700(size: 18.0),
                  ),
                  Container(
                    height: 28,
                    width: 100,
                    margin: EdgeInsets.only(right: 11),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: appColor, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "< >",
                          style:
                              commonTextStyle600(color: appColor, size: 12.0),
                        ),
                        Text(
                          "3Y Returns",
                          style: commonTextStyle600(size: 12.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ListView.builder(
                itemCount: 4,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 15, right: 15, top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Image(
                              image: AssetImage(AXISBANK),
                            ),
                          ),
                          SizedBox(width: 12),
                          // commonSizeBox(sizeW: 12.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Axis Small Cap Fund Direct Growth",
                                  maxLines: 2,
                                  style: commonTextStyle600(size: 16.0),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Equity Small Cap \u2022 5",
                                      style: commonTextStyle400(
                                        color: gray4,
                                        size: 13.0,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star_purple500_sharp,
                                      color: yellow,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "32.0%",
                                style: commonTextStyle600(
                                    size: 15.0, color: green),
                              ),
                              Text(
                                "3Y Returns",
                                style: commonTextStyle400(
                                  color: gray4,
                                  size: 12.0,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    commonDivider(jadai: 1.0),
                  ],
                ),
              ),
            ),
            commonDivider(height: 1.0, jadai: 3.0),
            Container(
              height: 86,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 151,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: white,
                        border: Border.all(
                          width: 1,
                          color: appColor,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        "ONE-TIME",
                        style: commonTextStyle700(
                          color: appColor,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 151,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: appColor,
                        boxShadow: [
                          BoxShadow(
                            color: appColor2F80ED.withOpacity(0.60),
                            blurRadius: 14,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        "MONTHLY SIP",
                        style: commonTextStyle700(
                          color: white,
                          size: 18.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  commonTextStyle700({var size, var color}) {
    return TextStyle(
      color: color ?? black2,
      fontFamily: "NunitoBold",
      fontWeight: FontWeight.w700,
      fontSize: size ?? 16.0,
    );
  }

  commonTextStyle600({var size, dynamic color}) {
    return TextStyle(
      color: color ?? black2,
      fontFamily: "NunitoSemiBold",
      fontWeight: FontWeight.w600,
      fontSize: size ?? 16.0,
    );
  }

  commonTextStyle400({var size, var color}) {
    return TextStyle(
      color: color ?? black2,
      fontFamily: "Nunito",
      fontWeight: FontWeight.w400,
      fontSize: size ?? 16.0,
    );
  }

  commonDivider({var jadai, var height}) {
    return Divider(
      color: grayF2F2F2,
      height: height ?? 1,
      thickness: jadai ?? 1,
    );
  }
}
