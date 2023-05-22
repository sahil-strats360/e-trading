import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/controller/conteiner_color_change_keypade.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'well_done_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/round_container.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// ignore: must_be_immutable
class VerifyPinScreenInAccount extends StatefulWidget {
  @override
  State<VerifyPinScreenInAccount> createState() =>
      _VerifyPinScreenInAccountState();
}

class _VerifyPinScreenInAccountState extends State<VerifyPinScreenInAccount> {
  ColorChangeController colorChangeController =
      Get.put(ColorChangeController());
  String text = '';

  void onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            CupertinoIcons.back,
            color: black,
          ),
        ),
        elevation: 0,
        backgroundColor: pageBackGroundC,
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "Verification PIN",
            style: TextStyle(
              fontSize: 25,
              color: black2,
              fontFamily: "NunitoBold",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: Get.height / 37.14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new LinearPercentIndicator(
                  width: 220,
                  animation: true,
                  lineHeight: 5.0,
                  // animationDuration: 1000,
                  percent: 0.7,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: appColor,
                  addAutomaticKeepAlive: true,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height / 44.57),
              child: Text(
                "Please enter your PIN to Proceed",
                style: TextStyle(
                  fontSize: 15,
                  color: black2,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 15.10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                otpNumberWidget(0, text),
                SizedBox(
                  width: 16,
                ),
                otpNumberWidget(1, text),
                SizedBox(
                  width: 16,
                ),
                otpNumberWidget(2, text),
                SizedBox(
                  width: 16,
                ),
                otpNumberWidget(3, text),
              ],
            ),
            SizedBox(
              height: Get.height / 26.21,
            ),
            InkWell(
              onTap: () {
                Get.to(WellDoneScreen());
              },
              child: Container(
                height: Get.height / 17.82,
                width: Get.width / 8.22,
                decoration: BoxDecoration(
                  color: green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: white,
                  size: Get.height / 29.714,
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 26.21,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Get.height / 44.57),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If You Forget Your PIN?",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "NunitoSemiBold",
                      color: black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(WellDoneScreen());
                      print("Sign Up");
                    },
                    child: Text(
                      "Reset PIN",
                      style: TextStyle(
                        fontSize: 15,
                        color: appColor,
                        fontFamily: "NunitoBold",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            NumericKeyboard(
              onKeyboardTap: onKeyboardTap,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textColor: appColor,
              rightIcon: Icon(
                Icons.backspace_outlined,
                color: Colors.black,
              ),
              rightButtonFn: () {
                setState(() {
                  text = text.substring(0, text.length - 1);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
