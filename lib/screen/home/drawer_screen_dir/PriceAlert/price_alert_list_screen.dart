import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/IPO/ipo_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/data.dart';

class PriceAlertListScreen extends StatelessWidget {
  const PriceAlertListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: commonAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stocks",
                    style: commonTextStyle400(
                      size: 12.0,
                      color: gray4,
                    ),
                  ),
                  Text(
                    "ALERT PRICE",
                    style: commonTextStyle400(
                      size: 12.0,
                      color: gray4,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: allStockScreenList.length,
              itemBuilder: (context, index) => Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                    allStockScreenList[index]["img"],
                                  ),
                                  width: 40,
                                  height: 25,
                                ),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(allStockScreenList[index]["title"],
                                    style: commonTextStyle600(size: 15.0)),
                              ],
                            ),
                          ),
                          Text(
                            "₹${allStockScreenList[index]["totalRs"]}",
                            style: commonTextStyle600(size: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  commonDivider(jadai: 1.0, color: gray1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  commonAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: pageBackGroundC,
      // centerTitle: true,
      elevation: 0,
      title: Text(
        "Create Price Alert",
        style: TextStyle(
          fontSize: 20,
          color: black2,
          fontFamily: "NunitoBold",
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            CupertinoIcons.clear,
            color: black1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
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
            child: TextFormField(
              cursorColor: appColor,
              /* controller: filterSortController.txtList,
                    focusNode: filterSortController.focusNode,*/
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
