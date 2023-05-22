import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/IPO/ipo_screen.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/PriceAlert/price_alert_list_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

class PriceAlertScreen extends StatelessWidget {
  const PriceAlertScreen({Key key}) : super(key: key);

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
          "Create Price Alert",
          style: TextStyle(
            fontSize: 20,
            color: black2,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: InkWell(
                onTap: () {
                  Get.to(PriceAlertListScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(ICICIBANK),
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text("ICICI", style: commonTextStyle600(size: 15.0)),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: grayD4D4D4,
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
            commonDivider(jadai: 1.0, color: grayE7E8EB),
            SizedBox(
              height: 32,
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: TextFormField(
                  cursorColor: black,
                  decoration: InputDecoration(
                    hintText: "Enter Price",
                    contentPadding: EdgeInsets.only(left: 2),
                    hintStyle: commonTextStyle400(size: 15.0, color: gray),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: gray1,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: gray1,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: gray1,
                      ),
                    ),
                  ),
                ) /*Text(
                "1,100",
                style: commonTextStyle400(size: 15.0),
              ),*/
                ),
            // commonDivider(jadai: 1.0, color: gray1),
            Padding(
              padding: const EdgeInsets.only(top: 9, bottom: 30),
              child: Text(
                "Current Price: ₹1,085",
                style: commonTextStyle400(size: 15.0),
              ),
            ),
            Container(
              height: 49,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: appColor,
                boxShadow: [
                  BoxShadow(
                    color: appColor2F80ED.withOpacity(0.60),
                    blurRadius: 14,
                  ),
                ],
                borderRadius: BorderRadius.circular(24.5),
              ),
              child: Text(
                "Apply For IPO",
                style: commonTextStyle700(
                  color: white,
                  size: 19.0,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 26.0, bottom: 8),
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
            commonDivider(jadai: 1.0, color: gray1),
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(ICICIBANK),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text("ICICI", style: commonTextStyle600(size: 15.0)),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text("₹1,100.00",
                            style: commonTextStyle600(size: 15.0)),
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset(bin),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            commonDivider(jadai: 1.0, color: gray1),
          ],
        ),
      ),
    );
  }
}
