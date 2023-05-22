import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/IPO/ipo_screen.dart';
import 'package:mymoney/utils/color.dart';

class MarginCalculatorScreen extends StatelessWidget {
  const MarginCalculatorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: pageBackGroundC,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: black1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Margin Calculator",
          style: TextStyle(
            fontSize: 20,
            color: black2,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          commonTextField(title: "Cost", hintText: "₹:125.00"),
          SizedBox(
            height: 22,
          ),
          commonTextField(title: "Revenue", hintText: "₹:250.00"),
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 144,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                      width: 1,
                      color: appColor,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    "Clear",
                    style: commonTextStyle700(
                      color: appColor,
                      size: 19.0,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 144,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: appColor,
                    boxShadow: [
                      BoxShadow(
                        color: appColor2F80ED.withOpacity(0.60),
                        blurRadius: 14,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    "Calculate",
                    style: commonTextStyle700(
                      color: white,
                      size: 19.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Answer",
                style: commonTextStyle700(size: 20.0),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 11),
            margin: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.15),
                  offset: Offset(0, 1),
                  blurRadius: 4,
                ),
              ],
              color: pageBackGroundC,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gross Margin:",
                        style: commonTextStyle700(size: 18.0),
                      ),
                      Text(
                        "50.00%",
                        style: commonTextStyle400(size: 18.0),
                      ),
                    ],
                  ),
                ),
                commonDivider(color: gray1, jadai: 1.0),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 9, top: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Markup:",
                        style: commonTextStyle600(size: 18.0),
                      ),
                      Text(
                        "100.00%",
                        style: commonTextStyle400(size: 18.0),
                      ),
                    ],
                  ),
                ),
                commonDivider(color: gray1, jadai: 1.0),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Markup:",
                        style: commonTextStyle600(size: 18.0),
                      ),
                      Text(
                        "100.00%",
                        style: commonTextStyle400(size: 18.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  commonTextField({var title, var hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        cursorColor: gray4,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: title,
          labelStyle: commonTextStyle400(color: gray4, size: 18.0),
          hintStyle: commonTextStyle400(color: gray, size: 18.0),
          contentPadding: EdgeInsets.all(12.0),
          // Inside box padding
          border: OutlineInputBorder(
            gapPadding: 3,
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: grayE7E8EB,
              width: 1.2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 3,
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: grayE7E8EB,
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 3,
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: grayE7E8EB,
              width: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
