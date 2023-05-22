import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/bloc/_account/account_cubit.dart';
import 'package:mymoney/bloc/_auth/auth_state.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/_account/account_state.dart';
import '../../../../bloc/_auth/auth_cubit.dart';
import '../../../../bloc/_auth/auth_state.dart' as AuthState;
import '../../../../model/user_model.dart';

class PersonalInformation extends StatelessWidget {
  String username;

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
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            CupertinoIcons.back,
            color: white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColorOrange,
        title: Text(
          "Personal Information",
          style: TextStyle(
            fontSize: 25,
            color: white,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocConsumer<AccountCubit, AccountState>(
        listener: (context, state) {
          //todo
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
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
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 29, left: 29, bottom: Get.height / 19.37, top: 9),
                  child: Container(
                    height: Get.height / 15.63,
                    width: Get.width,
                    child: Text(
                      "We get your personal information from the verification process. If you want to make changes on your personal information, contact our support.",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: white,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height / 7),
                child: Container(
                  height: Get.height / 1.35,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          personalDesign1(
                            textLabel: "First name",
                            // initvalue: userdetails.name,
                            hintText: userdetails.name,
                            onChange: (value) {
                              //todo
                              // setState(() {
                              // });
                              username = value;
                            },
                          ),
                          personalDesign1(
                            textLabel: "Last name",
                            hintText: "Hardwick",
                          ),
                          personalDesign1(
                            textLabel: "City",
                            hintText: "Fort Myers",
                          ),
                          personalDesign1(
                            textLabel: "ZIP/Area code",
                            hintText: "395010",
                          ),
                          personalDesign1(
                            textLabel: "Citizenship",
                            hintText: "India",
                          ),
                          /*Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(backgroundColor: Colors.lightBlue,),
                      ),*/

                          Padding(
                            padding: EdgeInsets.only(top: 39, bottom: 20),
                            child: buyDropDownButton(
                              textLabel: "Save",
                              onTapButton: () {
                                BlocProvider.of<AccountCubit>(context)
                                    .updateProfile(username);
                                // Navigator.pop(context);

                                // Get.back();
                              },
                            ),
                          ),
                        ],
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
}

personalDesign1(
    {String textLabel, String hintText, String initvalue, Function onChange}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      height: 76,
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textLabel,
            style: TextStyle(
              fontSize: 15,
              color: black2.withOpacity(0.6),
              fontFamily: "NunitoSemiBold",
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
            onChanged: onChange,
            cursorColor: appColor,
            initialValue: initvalue,
            autofocus: false,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: black2,
                fontSize: 19,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w800,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffE7E8EB),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffE7E8EB),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffE7E8EB),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
