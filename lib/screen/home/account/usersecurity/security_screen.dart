import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/home/drawer_open_.dart';
import '../../../../bloc/_change_password/change_password_cubit.dart';
import '../../../auth/forgetpassword/change_password_screen.dart';
import 'changepin/enter_old.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

import '../account_screen.dart';
import 'changepassword/change_password_security.dart';

class SecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        leading: InkWell(
          onTap: () {
            Get.to(DrawerOpenScreen());
          },
          child: Icon(
            CupertinoIcons.back,
            color: white,
          ),
        ),
        elevation: 0,
        backgroundColor: pageBackGroundC,
        centerTitle: true,
        title: Text(
          "Security",
          style: TextStyle(
            fontSize: 25,
            color: white,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.3, 0.7, 0.8],
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  kPrimaryColorOrange,
                  kPrimaryColororangePink,
                  kPrimaryColororangetoPink,
                  kPrimaryColorPink,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Column(
                children: [
                  Image.asset(
                    securityBenner,
                    height: Get.height / 2.84,
                  ),
                  Container(
                    height: Get.height / 1.83,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: grayE7E8EB,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(
                                BlocProvider(create: (context) => ChangePasswordCubit(), child: ChangePasswordScreen()),
                              );
                            },
                            child: design1Profile(
                              labelText: "Change Password",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(EnterOldPinScreen());
                            },
                            child: design1Profile(
                              labelText: "Change PIN",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
