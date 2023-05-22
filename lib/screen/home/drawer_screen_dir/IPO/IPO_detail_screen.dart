import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/IPO/ipo_screen.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/expnsiontile_widget_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

class IPODetailScreen extends StatelessWidget {
  const IPODetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: pageBackGroundC,
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
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image(
                          image: AssetImage(AXISBANK),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "AXISBANK IPO",
                              style: commonTextStyle700(size: 20.0),
                            ),
                            Text(
                              "NSC",
                              style: commonTextStyle400(
                                  color: gray7C828A, size: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "₹ 2126.20 ",
                        style: commonTextStyle700(
                          color: green,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Minimum Investment",
                        style:
                            commonTextStyle400(color: gray7C828A, size: 14.0),
                      ),
                    ),
                  ),
                  commonDivider(jadai: 3.0),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "IPO Details",
                        style: commonTextStyle700(size: 18.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Row(
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
                              style:
                                  commonTextStyle400(size: 12.0, color: gray4),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "₹65 - ₹68",
                              style: commonTextStyle400(size: 13.0),
                            ),
                            Text(
                              "Price Range",
                              style:
                                  commonTextStyle400(size: 12.0, color: gray4),
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
                              style:
                                  commonTextStyle400(size: 12.0, color: gray4),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "₹12,915",
                              style: commonTextStyle400(size: 13.0),
                            ),
                            Text(
                              "Min. Investment",
                              style:
                                  commonTextStyle400(size: 12.0, color: gray4),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "21",
                              style: commonTextStyle400(size: 13.0),
                            ),
                            Text(
                              "Lost Size",
                              style:
                                  commonTextStyle400(size: 12.0, color: gray4),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(pdf),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "RHP PDF",
                                  style: commonTextStyle400(
                                      size: 13.0, color: green),
                                ),
                              ],
                            ),
                            Text(
                              "IPO Doc",
                              style:
                                  commonTextStyle400(size: 12.0, color: gray4),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  commonDivider(jadai: 3.0),
                  commonTile(title: "About the Company"),
                  commonDivider(jadai: 3.0),
                  commonTile(title: "Strengths & Risks"),
                  commonDivider(jadai: 3.0),
                  commonTile(title: "Financials"),
                  commonDivider(jadai: 3.0),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5, right: 15, left: 15, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top IPO FAQs",
                          style: commonTextStyle700(size: 20.0),
                        ),
                        Text(
                          "Need Help?",
                          style:
                              commonTextStyle700(size: 15.0, color: appColor),
                        ),
                      ],
                    ),
                  ),
                  commonSubTile(),
                  commonSubTile(),
                  commonSubTile(),
                  commonSubTile(),
                  SizedBox(height: 130),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 51),
                child: Container(
                  height: 46,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: appColor,
                    boxShadow: [
                      BoxShadow(
                        color: appColor2F80ED.withOpacity(0.60),
                        blurRadius: 14,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: Text(
                    "Apply For IPO",
                    style: commonTextStyle700(
                      color: white,
                      size: 19.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  commonTextStyle300({var size, var color}) {
    return TextStyle(
      color: color ?? black2,
      fontFamily: "Nunito",
      fontWeight: FontWeight.w300,
      fontSize: size ?? 16.0,
    );
  }

  commonTile({var title}) {
    return ExpansionTil(
      verticalVisualDensity: -1,
      iconColor: appColor,
      contentPadding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      title: Text(
        title ?? "",
        style: commonTextStyle700(size: 20.0),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Text(
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,''',
            style: commonTextStyle300(size: 13.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Text(
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,''',
            style: commonTextStyle300(size: 13.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Text(
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,''',
            style: commonTextStyle300(size: 13.0),
          ),
        ),
      ],
    );
  }

  commonSubTile() {
    return ExpansionTil(
      verticalVisualDensity: -1,
      iconColor: appColor,
      contentPadding: const EdgeInsets.only(right: 15, left: 15),
      title: Text(
        "Lorem Ipsum is simply dummy text of the printing",
        style: commonTextStyle300(size: 13.0),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Text(
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,''',
            style: commonTextStyle300(size: 13.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Text(
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,''',
            style: commonTextStyle300(size: 13.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Text(
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,''',
            style: commonTextStyle300(size: 13.0),
          ),
        ),
      ],
    );
  }
}

commonDivider({var jadai, var height}) {
  return Divider(
    color: grayF2F2F2,
    height: height ?? 1,
    thickness: jadai ?? 1,
  );
}
