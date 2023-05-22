import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/controller/filter_sort_controller.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/mutualFunds/all_mutual_fund_screen.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/mutualFunds/buy_sell_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

// ignore: must_be_immutable
class MutualFundsScreen extends StatelessWidget {
  FilterSortController filterSortController = Get.put(FilterSortController());

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
            "Mutual Funds",
            style: TextStyle(
              fontSize: 20,
              color: black2,
              fontFamily: "NunitoBold",
              fontWeight: FontWeight.w700,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size(Get.width, 60),
            child: Container(
              color: pageBackGroundC,
              child: Container(
                height: 40,
                margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                // width: 700,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.15),
                      offset: Offset(0, 0.82),
                      blurRadius: 3.26,
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Obx(
                  () => TextFormField(
                    cursorColor: appColor,
                    controller: filterSortController.txtList,
                    focusNode: filterSortController.focusNode,
                    style: commonTextStyle600(size: 12.0, color: appColor),
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      hintText: "Search Mutual Funds",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: gray9B9797,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: gray9B9797,
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          filterSortController.txtList.clear();
                        },
                        icon: Icon(
                          Icons.clear,
                          color: filterSortController.controllerText.isEmpty
                              ? transPrent
                              : appColor,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                      // or do whatever you want when you are done editing
                      // call your method/print values etc
                    },
                  ),
                ),
              ),
            ),
          )),
      body: Obx(
        () => filterSortController.isLoading.isTrue
            ? filterSortController.controllerText.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: 21,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "AXIS Nifty Smallcap 50 Index Fund - Dir (G)",
                                style: commonTextStyle400(
                                  size: 14.0,
                                  color: gray7C828A,
                                ),
                              ),
                              SvgPicture.asset(arrowForword),
                              /*Icon(
                                Icons.arr,
                                color: gray7C828A,
                              ),*/
                            ],
                          ),
                        ),
                        commonDivider(jadai: 2.0),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 13, top: 14, bottom: 11),
                        child: Text(
                          "Recent Search",
                          style: commonTextStyle700(
                            size: 18.0,
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.update,
                                          color: gray7C828A,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "AXIS Nifty Smallcap 50 Index Fund - Dir (G)",
                                          style: commonTextStyle400(
                                            size: 14.0,
                                            color: gray7C828A,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.clear,
                                    color: gray7C828A,
                                  ),
                                ],
                              ),
                            ),
                            commonDivider(jadai: 2.0),
                          ],
                        ),
                      ),
                    ],
                  )
            : Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 13, left: 13, top: 14, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Popular Funds",
                              style: commonTextStyle700(size: 18.0),
                            ),
                            Text(
                              "See All",
                              style: commonTextStyle600(
                                  size: 15.0, color: appColor),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Get.to(BuySellScreen());
                            },
                            child: Container(
                              height: 85,
                              width: 328,
                              margin: EdgeInsets.only(
                                  left: 13, bottom: 15, right: 10),
                              padding: EdgeInsets.only(
                                  left: 8, bottom: 10, top: 8, right: 10),
                              decoration: BoxDecoration(
                                color: pageBackGroundC,
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: black.withOpacity(0.15),
                                    blurRadius: 4,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Image(
                                      image: AssetImage(AXISBANK),
                                    ),
                                  ),
                                  commonSizeBox(sizeW: 8.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Axis Small Cap Fund Direct Growth",
                                          maxLines: 2,
                                          style: commonTextStyle600(size: 15.0),
                                        ),
                                        Text(
                                          "Equity Small Cap \u2022 5",
                                          style: commonTextStyle400(
                                            color: gray4,
                                            size: 13.0,
                                          ),
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
                        ),
                      ),
                      commonDivider(jadai: 2.0, height: 2.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 13, top: 10),
                        child: Text(
                          "All Mutual Funds",
                          style: commonTextStyle700(size: 18.0),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 6,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15, left: 15, right: 15, top: 15),
                                child: InkWell(
                                  onTap: (){
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Axis Small Cap Fund Direct Growth",
                                              maxLines: 2,
                                              style:
                                                  commonTextStyle600(size: 16.0),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
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
                      commonSizeBox(sizeH: 110.0),
                    ],
                  ),
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    width: Get.width,
                    color: white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 23, right: 25, left: 25),
                      child: MaterialButton(
                        onPressed: () {
                          Get.to(AllMutualFundScreen());
                        },
                        elevation: 1,
                        color: pageBackGroundC,
                        height: 54,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "View All",
                              style: commonTextStyle700(
                                color: appColor,
                                size: 19.0,
                              ),
                            ),
                            commonSizeBox(sizeW: 10.0),
                            Icon(
                              Icons.arrow_forward,
                              color: appColor,
                            )
                          ],
                        ),
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
