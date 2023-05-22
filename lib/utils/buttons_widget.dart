import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/bloc/_buy_selll/buy_sell_cubit.dart';
import 'package:mymoney/utils/imagenames.dart';

import '../bloc/_buy_selll/buy_sell_state.dart';
import 'color.dart';

loginButton({String textLabel, onTapButton}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
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

    /*BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 12,
            spreadRadius: 2)
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    ),*/
    child: TextButton(
      onPressed: onTapButton,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        primary: Colors.white,
        textStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(
        "Login",
        style: TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoBold",
        ),
      ),
    ),
    /*child: MaterialButton(
      height: 49,
      minWidth: Get.width / 2.057,
      onPressed: onTapButton,
      color: appColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          25,
        ),
      ),
      child: Text(
        textLabel,
        style: TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoBold",
        ),
      ),
    ),*/
  );
}

changePasswordButton({String textLabel, onTapButton}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.3),
          spreadRadius: 4,
          blurRadius: 10,
          offset: Offset(0, 1),
        )
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    child: MaterialButton(
      height: Get.height / 19.37,
      minWidth: Get.width / 2.057,
      onPressed: onTapButton,
      color: appColor,
      // elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          25,
        ),
      ),
      child: Text(
        textLabel,
        style: TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoBold",
        ),
      ),
    ),
  );
}

resetButton({String textLabel, onTapButton}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
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
    child: TextButton(
      onPressed: onTapButton,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        primary: Colors.white,
        textStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(
        textLabel,
        style: TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoBold",
        ),
      ),
    ),

    /*MaterialButton(
      height: Get.height / 18.19,
      minWidth: Get.width / 2.046,
      onPressed: onTapButton,
      color: appColor,
      // elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          25,
        ),
      ),
      child: Text(
        textLabel,
        style: TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoSemiBold",
          fontWeight: FontWeight.w600,
        ),
      ),
    ),*/
  );
}

signUpButton({String textLabel, onTapButton}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
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
    child: TextButton(
      onPressed: onTapButton,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        primary: Colors.white,
        textStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(
        textLabel,
        style: TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoBold",
        ),
      ),
    ),

    /*MaterialButton(
      height: 49,
      minWidth: Get.width / 2.046,
      onPressed: onTapButton,
      color: appColor,
      // elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          25,
        ),
      ),
      child: Text(
        textLabel,
        style: TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoBold",
          fontWeight: FontWeight.w600,
        ),
      ),
    ),*/
  );
}

buyDropDownButton({String textLabel, onTapButton}) {
  return Container(
    decoration: BoxDecoration(
       gradient: LinearGradient(
        stops: [0.1, 0.3, 0.7, 0.8],
        colors: [
          kPrimaryColorOrange,
          kPrimaryColororangePink,
          kPrimaryColororangetoPink,
          kPrimaryColorPink,
        ],
        begin: Alignment.topRight,
        end: Alignment.topLeft,
      ),
      /*boxShadow: [
        BoxShadow(
          color: Colors.pink.withOpacity(0.3),
          spreadRadius: 4,
          blurRadius: 10,
          offset: Offset(0, 1),
        )
      ],*/
      borderRadius: BorderRadius.all(
        Radius.circular(14),
      ),
    ),
    child: MaterialButton(
      height: Get.height / 15.19,
      minWidth: Get.width / 3.076,
      onPressed: onTapButton,
      // color: kPrimaryColorPink,
      // elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          7,
        ),
      ),
      child: Text(
        textLabel,
        style: TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoBold",
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}

sellDropDownButton({String textLabel, onTapButton}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        stops: [0.1, 0.3, 0.7, 0.8],
        colors: [
          kPrimaryColorOrange,
          kPrimaryColororangePink,
          kPrimaryColororangetoPink,
          kPrimaryColorPink,
        ],
        begin: Alignment.topRight,
        end: Alignment.topLeft,
      ),
      /*boxShadow: [
        BoxShadow(
          color: Colors.pink.withOpacity(0.3),
          spreadRadius: 4,
          blurRadius: 10,
          offset: Offset(0, 1),
        )
      ],*/
      borderRadius: BorderRadius.all(
        Radius.circular(14),
      ),
    ),
    child: MaterialButton(
      height: Get.height / 15.19,
      minWidth: Get.width / 3.076,
      onPressed: onTapButton,
      // color: kPrimaryColorPink,
      // elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          7,
        ),
      ),
      child: Text(
        textLabel,
        style: TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoBold",
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}

addFundButton({String textLabel, onTapButton}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: green219653.withOpacity(0.4),
          spreadRadius: 4,
          blurRadius: 10,
          offset: Offset(0, 1),
        )
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(100),
      ),
    ),
    child: MaterialButton(
      height: Get.height / 18.19,
      minWidth: 153,
      onPressed: onTapButton,
      color: green219653,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          100,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: white,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            textLabel,
            style: TextStyle(
              color: white,
              fontSize: 19,
              fontFamily: "NunitoBold",
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}

withFundButton({String textLabel, onTapButton}) {
  return Container(
    decoration: BoxDecoration(
       gradient: LinearGradient(
              stops: [0.1, 0.3, 0.7, 0.8],
              colors: [
                kPrimaryColorOrange,
                kPrimaryColororangePink,
                kPrimaryColororangetoPink,
                kPrimaryColorPink,
              ],
              begin: Alignment.topRight,
              end: Alignment.topLeft,),
      // boxShadow: [
      //   BoxShadow(
      //     color: appColor.withOpacity(0.4),
      //     spreadRadius: 4,
      //     blurRadius: 10,
      //     offset: Offset(0, 1),
      //   )
      // ],
      borderRadius: BorderRadius.all(
        Radius.circular(100),
      ),
    ),
    child: MaterialButton(
      // height: Get.height / 18.19,
      minWidth: 153,
      onPressed: onTapButton,
      // color: appColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          100,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(stockUp),
          SizedBox(
            width: 6,
          ),
          Text(
            textLabel,
            style: TextStyle(
              color: white,
              fontSize: 19,
              fontFamily: "NunitoBold",
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}

buyButton({String textLabel, onTapButton}) {
  return BlocConsumer<BuySellCubit,BuySellState>(
    listener: (context, state) {
      //todo
    },
    builder: (context, state) {
      return Container(
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
          // boxShadow: [

          //   BoxShadow(
          //     color: Colors.blue.withOpacity(0.3),
          //     spreadRadius: 4,

          //     blurRadius: 10,
          //     offset: Offset(0, 1),
          //   )
          // ],
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: MaterialButton(
          // height: Get.height / 21.22,
          minWidth: Get.width / 2.85,
          onPressed: onTapButton,
          // color: appColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(
              25,
            ),
          ),
          child: Text(
            textLabel,
            style: TextStyle(
              color: white,
              fontSize: 19,
              fontFamily: "NunitoBold",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    },

  );
}

sellButton({String textLabel, onTapButton}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        stops: [0.1, 0.3, 0.7, 0.8],
        colors: [
          kPrimaryColorOrange,
          kPrimaryColororangePink,
          kPrimaryColororangetoPink,
          kPrimaryColorPink,
        ],
        begin: Alignment.topRight,
        end: Alignment.topLeft,
      ),
      /*boxShadow: [
        BoxShadow(
          color: Colors.pink.withOpacity(0.3),
          spreadRadius: 4,
          blurRadius: 10,
          offset: Offset(0, 1),
        )
      ],*/
      borderRadius: BorderRadius.all(
        Radius.circular(14),
      ),
    ),
    child: MaterialButton(
      height: Get.height / 15.19,
      minWidth: Get.width / 3.076,
      onPressed: onTapButton,
      // color: kPrimaryColorPink,
      // elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          7,
        ),
      ),
      child: Text(
        textLabel,
        style: TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoBold",
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
