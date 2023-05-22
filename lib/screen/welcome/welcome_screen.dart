import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/auth/signup/signup_screen.dart';
import '../../bloc/_login/login_cubit.dart';
import '../auth/login/login_screen.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => LoginCubit(), child: LogInScreen()),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => SystemNavigator.pop(),
      child: Scaffold(
        backgroundColor: pageBackGroundC,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                appLogo,
                height: Get.height / 5,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Welcome to",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  fontFamily: "NunitoSemiBold",
                ),
              ),
              Text(
                "eTrading",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  fontFamily: "NunitoBold",
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: Get.height / 4.81),
              //   child: loginButton(
              //       textLabel: "Login",
              //       onTapButton: () {
              //         Get.to(
              //           BlocProvider(
              //               create: (context) => LoginCubit(),
              //               child: LogInScreen()),
              //         );
              //       }),
              // ),
              SizedBox(
                height: Get.height / 49.52,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Don't have an account?",
              //       style: TextStyle(
              //         fontSize: 14,
              //         fontFamily: "Nunito",
              //         color: black,
              //       ),
              //     ),
              //     InkWell(
              //       onTap: () {
              //         Get.to(SignUpScreen());
              //       },
              //       child: ShaderMask(
              //         shaderCallback: (Rect bounds) {
              //           return LinearGradient(
              //             stops: [0.1, 0.3, 0.7, 0.8],
              //             colors: [kPrimaryColorOrange,
              //               kPrimaryColororangePink,
              //               kPrimaryColororangetoPink,
              //               kPrimaryColorPink,],
              //             begin: Alignment.topLeft,
              //             end: Alignment.bottomRight,
              //             tileMode: TileMode.clamp,
              //           ).createShader(bounds);
              //         },
              //         child: Text(
              //           " Sign up",
              //           style: TextStyle(
              //             fontSize: 14,
              //             color: Colors.white,
              //             fontFamily: "NunitoSemiBold",
              //           ),
              //         ),
              //       )

              //       /*Text(
              //         " Sign up",
              //         style: TextStyle(
              //           fontSize: 14,
              //           color: appColor,
              //           fontFamily: "NunitoSemiBold",
              //         ),
              //       ),*/
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
