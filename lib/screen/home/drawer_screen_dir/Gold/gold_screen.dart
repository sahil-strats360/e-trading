import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/IPO/ipo_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({Key key}) : super(key: key);

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
          "Gold",
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
          Row(
            children: [
              Container(
                width: Get.width / 3,
                height: 36,
                color: appColor,
                alignment: Alignment.center,
                child: Text(
                  "BUY",
                  style: commonTextStyle700(size: 14.0, color: white),
                ),
              ),
              Container(
                width: Get.width / 3,
                height: 36,
                color: grayE0E9F8,
                alignment: Alignment.center,
                child: Text(
                  "VAULT",
                  style: commonTextStyle700(size: 14.0),
                ),
              ),
              Container(
                width: Get.width / 3,
                height: 36,
                color: grayE0E9F8,
                alignment: Alignment.center,
                child: Text(
                  "SELL",
                  style: commonTextStyle700(size: 14.0),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Current Buying Price",
                              style: commonTextStyle600(size: 15.0),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "₹3,229.947/gm",
                              style: commonTextStyle700(
                                size: 18.0,
                                color: green,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Price vaild for ",
                                    style: commonTextStyle400(
                                        size: 14.0, color: gray4),
                                  ),
                                  TextSpan(
                                    text: "4:59",
                                    style: commonTextStyle400(
                                      size: 14.0,
                                      color: appColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(goldBanner),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  commonDivider(jadai: 3.0),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter amount of gold you want to buy",
                    textAlign: TextAlign.center,
                    style: commonTextStyle600(size: 15.0),
                  ),
                  Text(
                    "(Minimum amount ₹50)",
                    textAlign: TextAlign.center,
                    style: commonTextStyle400(size: 15.0, color: gray4),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 124,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'In Rupees',
                              style:
                                  commonTextStyle400(size: 12.0, color: gray4),
                            ),
                            Container(
                              height: 36,
                              width: 124,
                              padding: EdgeInsets.only(bottom: 2, left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: grayE7E8EB,
                                  width: 1.2,
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "₹ :  Amount",
                                  hintStyle: commonTextStyle400(
                                    color: gray,
                                    size: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SvgPicture.asset(barabar),
                      ),
                      SizedBox(
                        width: 124,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'In Grams',
                              style:
                                  commonTextStyle400(size: 12.0, color: gray4),
                            ),
                            Container(
                              height: 36,
                              width: 124,
                              padding: EdgeInsets.only(bottom: 2, left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: grayE7E8EB,
                                  width: 1.2,
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Wight",
                                  hintStyle: commonTextStyle400(
                                    color: gray,
                                    size: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "(includs of 3% GST)",
                      style: commonTextStyle400(
                        size: 10.0,
                        color: gray4,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: appColor,
                    height: 36,
                    elevation: 0,
                    minWidth: Get.width,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "BUY NOW",
                      style: commonTextStyle700(size: 14.0, color: white),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  commonDivider(jadai: 3.0),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "How it Works?",
                    style: commonTextStyle600(size: 15.0),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  commonRow(
                    title: "Buy Gold",
                    image: goldIngot,
                    subTitle:
                        "A safe and simple way to accumulate gold buy gold for as little as Rs.1",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  commonRow(
                    title: "Sell Gold",
                    image: coin,
                    subTitle:
                        "Sell your gold with one click. from anywhere and at anytime.",
                    widthSize: 18.0,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  commonRow(
                    title: "Secured Vault",
                    image: safe,
                    subTitle:
                        "Your gold is stored in vault controlled & monitor by Mymoney.",
                    widthSize: 18.0,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  commonRow({var image, var title, var subTitle, var widthSize}) {
    return Row(
      children: [
        Image(
          image: AssetImage(image),
        ),
        SizedBox(
          width: widthSize ?? 15.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: commonTextStyle600(size: 14.0),
              ),
              Text(
                subTitle,
                maxLines: 2,
                style: commonTextStyle400(
                  size: 14.0,
                  color: gray4,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
