import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/IPO/IPO_detail_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

class IPOScreen extends StatelessWidget {
  const IPOScreen({Key key}) : super(key: key);

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
          "Initial Public Offerings",
          style: TextStyle(
            fontSize: 20,
            color: black2,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 13),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Open Now (1)",
                  style: commonTextStyle700(
                    size: 18.0,
                  ),
                ),
              ),
            ),
            applySection(),
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 15, left: 13),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Upcoming (16)",
                  style: commonTextStyle700(size: 18.0),
                ),
              ),
            ),
            upComingFirst(),
            Container(
              height: 55,
              margin: EdgeInsets.only(left: 13, right: 13, bottom: 12),
              padding: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(YESBANK),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text("AXISBANK", style: commonTextStyle600(size: 15.0)),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: appColor,
                    size: 18,
                  )
                ],
              ),
            ),
            commonContainer(image: YESBANK, title: "YESBANK"),
            commonContainer(image: HDFCBANK, title: "HDFCBANK"),
            commonContainer(image: PARLE, title: "AXISBANK"),
            commonContainer(image: YESBANK, title: "YESBANK"),
            commonContainer(image: HDFCBANK, title: "HDFCBANK"),
            commonContainer(image: PARLE, title: "AXISBANK"),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  applySection() {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 13),
      padding: EdgeInsets.only(bottom: 18, top: 16),
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 14, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(AXISBANK),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text("AXISBANK", style: commonTextStyle600(size: 15.0)),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: appColor,
                  size: 18,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Column(
              children: [
                Text(
                  "Bidding Dates",
                  style: commonTextStyle600(size: 20.0, color: gray4),
                ),
                Text(
                  "24 Mar - 28 Mar ‘22",
                  style: commonTextStyle600(size: 13.0, color: appColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Price Range",
                      style: commonTextStyle600(size: 20.0, color: gray4),
                    ),
                    Text(
                      "₹615 - ₹650",
                      style: commonTextStyle600(size: 13.0, color: appColor),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Issue Size",
                      style: commonTextStyle600(size: 20.0, color: gray4),
                    ),
                    Text(
                      "4,300 Cr",
                      style: commonTextStyle600(size: 13.0, color: appColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(IPODetailScreen());
            },
            child: Container(
              height: 46,
              width: 201,
              margin: EdgeInsets.only(top: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: appColor,
                boxShadow: [
                  BoxShadow(
                    color: appColor2F80ED.withOpacity(0.60),
                    blurRadius: 14,
                  ),
                ],
                borderRadius: BorderRadius.circular(21.0),
              ),
              child: Text(
                "Apply",
                style: commonTextStyle700(
                  color: white,
                  size: 19.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  upComingFirst() {
    return Container(
      margin: EdgeInsets.only(left: 13, right: 13, bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 16),
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(AXISBANK),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text("AXISBANK", style: commonTextStyle600(size: 15.0)),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: appColor,
                  size: 18,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "28 Mar - 30 Mar ‘22",
                    style: commonTextStyle400(size: 13.0),
                  ),
                  Text(
                    "Bidding Dates",
                    style: commonTextStyle400(size: 13.0, color: gray4),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "₹65 - ₹68",
                    style: commonTextStyle400(size: 13.0),
                  ),
                  Text(
                    "Price Range",
                    style: commonTextStyle400(size: 13.0, color: gray4),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "60 Cr",
                    style: commonTextStyle400(size: 13.0),
                  ),
                  Text(
                    "Issue Size",
                    style: commonTextStyle400(size: 13.0, color: gray4),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  commonContainer({var title, var image}) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(left: 13, right: 13, bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image(
                  image: AssetImage(image),
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 9,
                ),
                Text(title, style: commonTextStyle600(size: 15.0)),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: appColor,
            size: 18,
          )
        ],
      ),
    );
  }
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

commonDivider({var jadai, var height, var color}) {
  return Divider(
    color: color ?? grayF2F2F2,
    height: height ?? 1,
    thickness: jadai ?? 1,
  );
}
