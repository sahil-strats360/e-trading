import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/controller/conteiner_color_change_keypade.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/round_container.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

import 'enter_new_pin_screen.dart';
import 'forgetpin_email_security.dart';

// ignore: must_be_immutable
class EnterOldPinScreen extends StatefulWidget {
  @override
  State<EnterOldPinScreen> createState() => _EnterOldPinScreenState();
}

class _EnterOldPinScreenState extends State<EnterOldPinScreen> {
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
        flexibleSpace:  Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.1, 0.3, 0.7, 0.8],
              colors: [kPrimaryColorOrange,
                kPrimaryColororangePink,
                kPrimaryColororangetoPink,
                kPrimaryColorPink,],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        //backgroundColor: pageBackGroundC,
        centerTitle: true,
        title: Text(
          "Enter Old Pin",
          style: TextStyle(
            fontSize: 25,
            color: white,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: white,
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
              "Please enter your PIN to Proceed",
              style: TextStyle(
                fontSize: 15,
                color: black2,
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
                 
                Get.to(EnterNewPin());
                        },
              child: Container(
                height: Get.height / 17.82,
                width: Get.width / 8.22,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: white,
                  size: Get.height / 29.71,
                ),
              ),
            ),

            // InkWell(
            //   onTap: () {
            //     Get.to(EnterNewPin());
            //   },
            //   child: Container(
            //     height: Get.height / 17.82,
            //     width: Get.width / 8.22,
            //     decoration: BoxDecoration(
            //       color: green,
            //       shape: BoxShape.circle,
            //     ),
            //     child: Icon(
            //       Icons.arrow_forward,
            //       color: white,
            //       size: Get.height / 29.71,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: Get.height / 29.71,
            ),
            Row(
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
                    Get.to(RestPinEmailSecurityScreen());
                    //         print("Sign Up");
                  },
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        stops: [0.1, 0.3, 0.7, 0.8],
                        colors: [
                          kPrimaryColorOrange,
                          kPrimaryColororangePink,
                          kPrimaryColororangetoPink,
                          kPrimaryColorPink,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.clamp,
                      ).createShader(bounds);
                    },
                    child: Text(
                      " Reset PIN",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: "NunitoSemiBold",
                      ),
                    ),
                  ),

                  /*Text(
                    "Reset PIN",
                    style: TextStyle(
                      fontSize: 15,
                      color: appColor,
                      fontFamily: "NunitoBold",
                    ),
                  ),*/
                ),
              ],
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "If You Forget Your PIN?",
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontFamily: "NunitoSemiBold",
            //         color: black,
            //       ),
            //     ),
            //     InkWell(
            //       onTap: () {
            //         Get.to(RestPinEmailSecurityScreen());
            //         print("Sign Up");
            //       },
            //       child: Text(
            //         "Reset PIN",
            //         style: TextStyle(
            //           fontSize: 15,
            //           color: appColor,
            //           fontFamily: "NunitoBold",
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: Get.height / 29.714,
            ),
             NumericKeyboard(
              onKeyboardTap: onKeyboardTap,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textColor: Colors.pink,
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

            // NumericKeyboard(
            //   onKeyboardTap: onKeyboardTap,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   textColor: appColor,
            //   rightIcon: Icon(
            //     Icons.backspace_outlined,
            //     color: Colors.black,
            //   ),
            //   rightButtonFn: () {
            //     setState(() {
            //       text = text.substring(0, text.length - 1);
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
