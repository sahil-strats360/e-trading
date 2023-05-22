// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/controller/checkbox_controller.dart';
import 'package:mymoney/screen/auth/forgetpassword/forgetpassword_screen.dart';
import 'package:mymoney/screen/auth/signup/signup_screen.dart';
import 'package:mymoney/screen/auth/verification.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';
import 'package:mymoney/utils/textformfild.dart';

import '../../../bloc/_auth/auth_cubit.dart';
import '../../../bloc/_login/login_cubit.dart';
import '../../../bloc/_login/login_state.dart';
import '../../../utils/email_validation.dart';
import '../../../utils/password_validation.dart';

// ignore: must_be_immutable
class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String emailError, passwordError;
  bool _passwordVisible = true;
  String email, password;

  var formkey = GlobalKey<FormState>();

  CheckBoxController checkBoxController = Get.put(CheckBoxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state)async {
          //todo
          if (state is Submited) {
            await BlocProvider.of<AuthCubit>(context).loadUserDetails();
            Get.to(
              VerificationScreen(),
            );
            print("ok Good");
          }
          if (state is Failed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.msg)));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                //color: pageBackGroundC,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      kPrimaryColorOrange,
                      kPrimaryColororangePink,
                      kPrimaryColororangetoPink,
                      kPrimaryColorPink,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.height / 14),
                    child: Column(
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 26,
                            color: white,
                            fontFamily: "NunitoBold",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Image.asset(
                            loginBenner,
                            height: Get.height / 2.56,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height / 2.20),
                child: Container(
                  height: Get.height / 1.7,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 15.23,
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height / 17.47,
                            ),
                            textFromFieldDesign(
                              enable: !(state is Submiting),
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "required";
                                }
                                if (validEmail(value)) {
                                  email = value;
                                } else {
                                  return "Please enter a valid Email Address";
                                }
                              },
                              hint: "Email",
                              iconWidget: Icon(
                                Icons.email_outlined,
                                color: gray,
                              ),
                              // iconWidget1: Icon(
                              //   Icons.visibility_outlined,
                              //   color: gray,
                              // ),
                            ),
                            SizedBox(
                              height: Get.height / 31.83,
                            ),
                            textFromFieldDesign(
                              enable: !(state is Submiting),
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Required";
                                }
                                if (value.length < 6) {
                                  return "Password should be 6 digit long";
                                } else {
                                  password = value;
                                }
                                // if (validPassword(value)) {
                                //   password = value;
                                // } else {
                                //   return " Password should contain Capital, small letter & Number & Special";
                                // }
                              },
                              hint: "Password",
                              sequre: _passwordVisible,
                              iconWidget: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  lockIcon,
                                  color: gray,
                                ),
                              ),
                              iconWidget1: IconButton(
                                onPressed: state is Submiting
                                    ? null
                                    : () {
                                        _toggle();
                                      },
                                icon: Icon(
                                  !_passwordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_rounded,
                                  color: gray,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Obx(
                                        () => Checkbox(
                                          value:
                                              checkBoxController.isCheck.value,
                                          activeColor: appColor,
                                          onChanged: (val) {
                                            checkBoxController.isCheck.value =
                                                !checkBoxController
                                                    .isCheck.value;
                                          },
                                        ),
                                      ),
                                      Text(
                                        "Remember me",
                                        style: TextStyle(
                                          color: black.withOpacity(0.6),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "MontserratRegular",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: state is Submiting
                                      ? null
                                      : () {
                                          Get.to(
                                            ForGetPassword(),
                                          );
                                        },
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: black.withOpacity(0.6),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "MontserratRegular",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height / 22.20,
                            ),
                            state is Submiting?
                            CircularProgressIndicator():SizedBox(),
                             SizedBox(
                              height: Get.height / 16.20,
                            ),
                            loginButton(
                              onTapButton: state is Submiting
                                  ? null
                                  : () {
                                      if (formkey.currentState.validate()) {
                                        BlocProvider.of<LoginCubit>(context)
                                            .login(email, password);
                                        print("login");
                                        // Get.to(
                                        //   VerificationScreen(),
                                        // );
                                      }
                                    },
                              textLabel: "Log In",
                            ),
                            SizedBox(
                              height: Get.height / 74.28,
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
                            //         Get.to(
                            //           SignUpScreen(),
                            //         );
                            //         print("Sign Up");
                            //       },
                            //       child: ShaderMask(
                            //         shaderCallback: (Rect bounds) {
                            //           return LinearGradient(
                            //             colors: [
                            //               kPrimaryColorOrange,
                            //               kPrimaryColororangePink,
                            //               kPrimaryColororangetoPink,
                            //               kPrimaryColorPink,
                            //             ],
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
                            //       ),

                            //       /*Text(
                            //       "Sign up",
                            //       style: TextStyle(
                            //         fontSize: 14,
                            //         color: appColor,
                            //         fontFamily: "NunitoSemiBold",
                            //       ),
                            //     ),*/
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
}
