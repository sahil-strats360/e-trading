// ignore_for_file: unnecessary_statements

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mymoney/bloc/_change_password/change_password_state.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/textformfild.dart';

import '../../../bloc/_change_password/change_password_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  String old_password, new_password, confrim_password;

  

  // String oldPassword_error = "",
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
          "Change Password",
          style: TextStyle(
            fontSize: 25,
            color: black1,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w600,
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
      body: Padding(
        padding: EdgeInsets.only(top: Get.height / 17.82),
        child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            //todo
            if (state is Submited) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
            if (state is Failed) {
              // if (state.msg == "Your old password is wrong") {
              //   // setState(() {
              //     oldPassword_error = state.msg;
              //   // });
              // }
              // if (state.msg == "password not match") {
              //   // setState(() {
              //     confrimPassword_error = state.msg;
              //     newPassword_error = state.msg;
              //   // });
              // }
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
          },
          builder: (context, state) {
            return Container(
              height: Get.height / 1.17,
              width: Get.width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 17.14,
                      vertical: Get.height / 25.46),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        textFromFieldDesign1(
                          enable: !(state is Submiting),
                          valid: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            if (value.length < 8) {
                              return "Password should be 8 digit long";
                            } else {
                              old_password = value;
                            }
                          },
                          hint: "old password",
                          iconWidget1: Icon(
                            Icons.visibility_outlined,
                            color: gray4,
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 22.28,
                        ),
                        textFromFieldDesign1(
                          enable: !(state is Submiting),
                          hint: "New password",
                          valid: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            if (value.length < 8) {
                              return "Password should be 8 digit long";
                            } else {
                              new_password = value;
                            }
                          },
                          iconWidget1: Icon(
                            Icons.visibility_outlined,
                            color: gray4,
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 22.28,
                        ),
                        textFromFieldDesign1(
                          enable: !(state is Submiting),
                          valid: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            if (value.length < 8) {
                              return "Password should be 6 digit long";
                            } else {
                              confrim_password = value;
                            }
                          },
                          hint: "Repeat password",
                          iconWidget1: Icon(
                            Icons.visibility_outlined,
                            color: gray4,
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 12.73,
                        ),
                        resetButton(
                          textLabel: "Change Password",
                          onTapButton: state is Submiting
                              ? null
                              : () {
                                  if (formKey.currentState.validate()) {
                                    BlocProvider.of<ChangePasswordCubit>(
                                            context)
                                        .changePassword(old_password,
                                            new_password, confrim_password);
                                    print("login");
                                  }

                                  // Get.off(
                                  //   LogInScreen(),
                                  // );
                                },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
