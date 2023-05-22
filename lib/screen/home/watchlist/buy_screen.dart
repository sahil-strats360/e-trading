import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mymoney/utils/color.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height / 5,
        // centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "AXISBANK",
          style: TextStyle(
            fontSize: 20,
            color: white,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         height: 50,
      //         decoration: BoxDecoration(
      //           // Box decoration takes a gradient
      //           color: Colors.grey,
      //         ),
      //         child: Text(data),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
