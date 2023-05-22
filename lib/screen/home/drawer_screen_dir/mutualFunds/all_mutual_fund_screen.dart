import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/mutualFunds/buy_sell_screen.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/mutualFunds/filter_sort_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

class AllMutualFundScreen extends StatelessWidget {
  const AllMutualFundScreen({Key key}) : super(key: key);

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
          "All Mutual Funds",
          style: TextStyle(
            fontSize: 20,
            color: black2,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 4,
          ),
          Container(
            height: 44,
            width: Get.width,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.25),
                  offset: Offset(0, 1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(FilterSortScreen());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Text(
                          "Filter / Sort  ",
                          style: commonTextStyle600(size: 12.0),
                        ),
                        SvgPicture.asset(menu),
                      ],
                    ),
                  ),
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
                        style: commonTextStyle600(color: appColor, size: 12.0),
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
          Expanded(
            child: ListView.builder(
              itemCount: 12,
              shrinkWrap: true,
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 15, right: 15, top: 15),
                    child: InkWell(
                      onTap: () {
                        Get.to(BuySellScreen());
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Image(
                              image: AssetImage(AXISBANK),
                            ),
                          ),
                          commonSizeBox(sizeW: 12.0),
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
                  ),
                  commonDivider(jadai: 1.0),
                ],
              ),
            ),
          ),
          commonSizeBox(sizeH: 50.0),
        ],
      ),
    );
  }

  commonTextStyle600({var size, var color}) {
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

  commonSizeBox({var sizeH, var sizeW}) {
    return SizedBox(
      height: sizeH ?? 0,
      width: sizeW ?? 0,
    );
  }
}
