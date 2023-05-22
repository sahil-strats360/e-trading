import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/home/account/news/latest_news.dart';
import 'package:mymoney/screen/home/account/orders/order_screen.dart';
import 'package:mymoney/screen/home/fund/fund_screen.dart';
import '../../../bloc/_account/account_cubit.dart';
import '../../../bloc/_account/account_state.dart';
import '../../../bloc/_auth/auth_cubit.dart';
import '../../../bloc/_auth/auth_state.dart' as AuthState;
import '../../../model/user_model.dart';
import '../../../utils/sequre_storage.dart';
import 'personal/personal_information.dart';
import 'phoneverify/phone_verify_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'usersecurity/security_screen.dart';

class AccountScreen extends StatelessWidget {

  User userdetails;
  @override
  Widget build(BuildContext context) {
    userdetails =
        (BlocProvider.of<AuthCubit>(context).state as AuthState.Authenticated)
            .userdata;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.1, 0.3, 0.7, 0.8],
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
        ),
        leading: IconButton(
          // add a back button
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Perform action on back arrow press
          },
        ),
        title: Text('Profile',
            style:
                TextStyle(color: Colors.white)), // set the title and text color
        centerTitle: true, // center the title

        //backgroundColor: pageBackGroundC,
        elevation: 0,
      ),
      body: BlocConsumer<AccountCubit, AccountState>(
        listener: (context, state) {
          //todo
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height,
                    //color: pageBackGroundC,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: [0.1, 0.3, 0.7, 0.8],
                        colors: [
                          kPrimaryColorOrange,
                          kPrimaryColororangePink,
                          kPrimaryColororangetoPink,
                          kPrimaryColorPink,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                  ),
                  /* Container(
                  height: 86, // set the height as per your requirement
                  color: Colors.transparent, // set the color as per your requirement
                  child: Row(
                    children: [
                      // set the width as per your requirement
                      IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            // Perform action on back arrow press
                          },
                        ),
                      Expanded(
                        child: Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),*/
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: Get.width,
                      height: Get.height / 1.10,
                      decoration: BoxDecoration(
                        color: grayE7E8EB,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: Get.height / 19.71,
                          // bottom: Get.height / 13.71,

                          left: Get.width / 17.14,
                          right: Get.width / 17.14,
                        ),
                        child: Column(
                          children: [
                            Text(
                              userdetails.name,
                              style: TextStyle(
                                fontSize: 19,
                                color: black2,
                                fontFamily: "NunitoSemiBold",
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: Get.height / 40.14,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(
                                  BlocProvider(
                                      create: (context) => AccountCubit(),
                                      child: PersonalInformation()),
                                );
                              },
                              child: design1Profile(
                                labelText: "Personal information",
                              ),
                            ),
                            /*InkWell(
                            onTap: () {
                              Get.to(PhoneVerifyScreen());
                            },
                            child: design1Profile(
                              labelText: "Phone number verification",
                            ),
                          ),*/
                            ///to be changed
                            InkWell(
                              onTap: () {
                                Get.to(LatestNews());
                              },
                              child: design1Profile(
                                labelText: "Latest News",
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(FundScreen());
                              },
                              child: design1Profile(
                                labelText: "Funds",
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(PhoneVerifyScreen());
                              },
                              child: design1Profile(
                                labelText: "Learnings",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: Get.height / 38.75),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Settings",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: black2,
                                    fontFamily: "NunitoBold",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height / 127.34,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(SecurityScreen());
                              },
                              child: design1Profile(
                                labelText: "Security",
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: design1Profile(
                                labelText: "Help & Support",
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: design1Profile(
                                labelText: "Legaly",
                              ),
                            ),
                            state is Submitting
                                ? SizedBox(
                                    height: Get.height / 22.20,
                                  )
                                : SizedBox(),
                            state is Submitting
                                ? CircularProgressIndicator()
                                : InkWell(
                                    onTap: () {
                                      // deletToken();
                                      BlocProvider.of<AccountCubit>(context)
                                          .logout();
                                      Navigator.popUntil(
                                          context, (route) => route.isActive);
                                    },
                                    child: Container(
                                      // child: Text("data"),
                                      height: Get.height / 15,
                                      width: Get.width,
                                      margin: EdgeInsets.only(top: 16),

                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Text(
                                              "Log out",
                                              style: TextStyle(
                                                fontSize: 19,
                                                color: red,
                                                fontFamily: "NunitoSemiBold",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            // SizedBox(height: 25,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.height > 750 ? Get.height / 29.71 : 10,
                    left: Get.width / 2.63,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            //SizedBox(height: Get.height/12,),
                            Container(
                              height: Get.height / 11.14,
                              width: Get.width / 5.14,
                              decoration: BoxDecoration(
                                color: white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff40000000),
                                    spreadRadius: 0.5,
                                    blurRadius: 3,
                                    offset: Offset(0, 6),
                                  )
                                ],
                                image: DecorationImage(
                                  image: AssetImage(profilePic),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          // bottom: ,
                          child: Column(
                            children: [
                              // SizedBox(height: Get.height/12,),
                              Container(
                                height: Get.height / 35.65,
                                width: Get.width / 16.45,
                                decoration: BoxDecoration(
                                  color: white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  size: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

design1Profile({String labelText}) {
  return Container(
    height: Get.height / 15,
    width: Get.width,
    margin: EdgeInsets.only(top: 16),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 19,
            color: black2,
            fontFamily: "NunitoSemiBold",
            fontWeight: FontWeight.w600,
          ),
        ),
        Icon(
          Icons.arrow_forward,
          color: kPrimaryColororangePink,
          size: 30,
        ),
      ],
    ),
  );
}
