import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/controller/filter_sort_controller.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

// ignore: must_be_immutable
class FilterSortScreen extends StatelessWidget {
  FilterSortController filterSortController = Get.find();

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
          "Filter - Sort",
          style: TextStyle(
            fontSize: 20,
            color: black2,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Container(
                  height: Get.height,
                  width: Get.width / 2,
                  child: Column(
                    children: [
                      Obx(
                        () => commonContainer(
                          title: "AMC",
                          isSelect: filterSortController.isSelected1.value,
                          onTap: () {
                            conditionFilter();
                            filterSortController.isSelected1.value =
                                !filterSortController.isSelected1.value;
                          },
                        ),
                      ),
                      Obx(
                        () => commonContainer(
                          title: "Category",
                          isSelect: filterSortController.isSelected2.value,
                          onTap: () {
                            conditionFilter();
                            filterSortController.isSelected2.value =
                                !filterSortController.isSelected2.value;
                          },
                        ),
                      ),
                      Obx(
                        () => commonContainer(
                          title: "Rating",
                          isSelect: filterSortController.isSelected3.value,
                          onTap: () {
                            conditionFilter();
                            filterSortController.isSelected3.value =
                                !filterSortController.isSelected3.value;
                          },
                        ),
                      ),
                      Obx(
                        () => commonContainer(
                          title: "Risk",
                          isSelect: filterSortController.isSelected4.value,
                          onTap: () {
                            conditionFilter();
                            filterSortController.isSelected4.value =
                                !filterSortController.isSelected4.value;
                          },
                        ),
                      ),
                      Obx(
                        () => commonContainer(
                          title: "Available to invest",
                          isSelect: filterSortController.isSelected5.value,
                          onTap: () {
                            conditionFilter();
                            filterSortController.isSelected5.value =
                                !filterSortController.isSelected5.value;
                          },
                        ),
                      ),
                      Obx(
                        () => commonContainer(
                          title: "Sort By",
                          isSelect: filterSortController.isSelected6.value,
                          onTap: () {
                            conditionFilter();
                            filterSortController.isSelected6.value =
                                !filterSortController.isSelected6.value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height,
                  width: Get.width / 2,
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.only(left: 13),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: redEBEBF0,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => filterSortController.isSelected1.isTrue
                              ? selected1()
                              : Container(),
                        ),
                        Obx(
                          () => filterSortController.isSelected2.isTrue
                              ? selected2()
                              : Container(),
                        ),
                        Obx(
                          () => filterSortController.isSelected3.isTrue
                              ? selected3()
                              : Container(),
                        ),
                        Obx(
                          () => filterSortController.isSelected4.isTrue
                              ? selected4()
                              : Container(),
                        ),
                        Obx(
                          () => filterSortController.isSelected5.isTrue
                              ? selected5()
                              : Container(),
                        ),
                        Obx(
                          () => filterSortController.isSelected6.isTrue
                              ? selected6()
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: 146,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  backGroundFilter,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 144,
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
                      "Clear All",
                      style: commonTextStyle700(
                        color: appColor,
                        size: 19.0,
                      ),
                    ),
                  ),
                  /*SizedBox(
                    width: 22,
                  ),*/
                  Container(
                    height: 50,
                    width: 144,
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
                      "Apply",
                      style: commonTextStyle700(
                        color: white,
                        size: 19.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
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

  commonContainer({var title, var onTap, var isSelect}) {
    return Container(
      margin: EdgeInsets.only(right: 5, bottom: 2),
      color: redEFF5FB,
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: TextStyle(
            color: isSelect == true ? appColor : black,
            fontFamily: "NunitoSemiBold",
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
        contentPadding: EdgeInsets.only(left: 13),
      ),
    );
  }

  selected1() {
    return Expanded(
      child: ListView.builder(
        itemCount: 30,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 23),
          child: Text(
            "\u2022 Aditya Birla Sun Life",
            overflow: TextOverflow.ellipsis,
            style: commonTextStyle600(size: 14.0),
          ),
        ),
      ),
    );
  }

  selected2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Debt Schemes",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Equity Schemes",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Habrid Schemes",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Other Schemes",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Solution Oriented Schemes",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
      ],
    );
  }

  selected3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 23,
        ),
        Row(
          children: [
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
          ],
        ),
        SizedBox(
          height: 23,
        ),
        Row(
          children: [
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Text(
              " & Up",
              style: commonTextStyle600(size: 14.0),
            )
          ],
        ),
        SizedBox(
          height: 23,
        ),
        Row(
          children: [
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Text(
              " & Up",
              style: commonTextStyle600(size: 14.0),
            )
          ],
        ),
        SizedBox(
          height: 23,
        ),
        Row(
          children: [
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Icon(
              Icons.star_purple500_sharp,
              color: yellow,
            ),
            Text(
              " & Up",
              style: commonTextStyle600(size: 14.0),
            )
          ],
        ),
      ],
    );
  }

  selected4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Low",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Moderately Low",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Moderate",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Moderately High",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 High",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Very High",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
      ],
    );
  }

  selected5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 SIP",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 ONE-TIME",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
      ],
    );
  }

  selected6() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Popularity",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Ratings-High to Low",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "\u2022 Returns-High to Low",
          overflow: TextOverflow.ellipsis,
          style: commonTextStyle600(size: 14.0),
        ),
      ],
    );
  }
}
