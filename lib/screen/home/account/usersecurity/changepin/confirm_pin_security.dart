import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mymoney/controller/conteiner_color_change_keypade.dart';
import 'package:mymoney/utils/color.dart';

import 'package:mymoney/utils/round_container.dart';

import 'package:numeric_keyboard/numeric_keyboard.dart';

import '../security_screen.dart';

// ignore: must_be_immutable
class EnterNewPinConfirmScreen extends StatefulWidget {
  @override
  State<EnterNewPinConfirmScreen> createState() =>
      _EnterNewPinConfirmScreenState();
}

class _EnterNewPinConfirmScreenState extends State<EnterNewPinConfirmScreen> {
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
      backgroundColor: pageBackGroundC,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: pageBackGroundC,
        centerTitle: true,
        title: Text(
          "Confirm PIN",
          style: TextStyle(
            fontSize: 25,
            color: black2,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: black1,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Repeat a PIN code to continue",
              style: TextStyle(
                fontSize: 15,
                color: black2.withOpacity(0.6),
                fontFamily: "Nunito",
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: Get.height / 11.72,
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
              height: Get.height / 24.09,
            ),
            InkWell(
              onTap: () {
                Get.off(SecurityScreen());
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
                  size: Get.height / 29.71,
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 29.714,
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
