import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/bloc/_buy_selll/buy_sell_cubit.dart';
import 'package:mymoney/bloc/_buy_selll/buy_sell_state.dart';
import 'package:mymoney/controller/conteiner_color_change_keypade.dart';
import 'package:mymoney/controller/drawer_open_controller.dart';
import 'package:mymoney/controller/tabcontroller_screen.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/mutualFunds/buy_sell_screen.dart';
import 'package:mymoney/screen/home/watchlist/candel_chart.dart';
import 'package:mymoney/screen/home/watchlist/toggle_design_screen.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';
import '../drawer_open_.dart';

final MyTabController myTabController = Get.put(MyTabController());
ColorChangeController colorChangeController = Get.put(
  ColorChangeController(),
);
bool showtextbox = false;

class BuySellScreen extends StatefulWidget {
  String name, marketsymbol;
  BuySellScreen(this.name, this.marketsymbol);
  @override
  State<BuySellScreen> createState() => _BuySellScreenState();
}

class _BuySellScreenState extends State<BuySellScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BuySellCubit, BuySellState>(
      listener: (context, state) {
        //todo
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: white,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            // backgroundColor: kPrimaryColororangetoPink,
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
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
              // "AXISBANK",
              widget.name,
              style: TextStyle(
                fontSize: 20,
                color: white,
                fontFamily: "NunitoBold",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: SafeArea(
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
                  Container(
                    height: Get.height,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22.56),
                        topRight: Radius.circular(22.56),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 21, left: 13, right: 18),
                          child: Container(
                            width: Get.width,
                            // height: 56,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹2126.20",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                        fontFamily: "NunitoBold",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    // ToggleScreen(green219653),
                                    Row(
                                      children: [
                                        Text(
                                          "+30.00",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: gray9B9797,
                                            fontFamily: "Nunito",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "(",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: gray9B9797,
                                                  fontFamily: "Nunito",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "+0.72%",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: gray9B9797,
                                                  fontFamily: "Nunito",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ")",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: gray9B9797,
                                                  fontFamily: "Nunito",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                //   children: [
                                //     Text(
                                //       "+30.00",
                                //       style: TextStyle(
                                //         fontSize: 18,
                                //         color: black,
                                //         fontFamily: "Nunito",
                                //         fontWeight: FontWeight.w400,
                                //       ),
                                //     ),
                                //     RichText(
                                //       text: TextSpan(
                                //         children: [
                                //           TextSpan(
                                //             text: "(",
                                //             style: TextStyle(
                                //               fontSize: 18,
                                //               color: black,
                                //               fontFamily: "Nunito",
                                //               fontWeight: FontWeight.w400,
                                //             ),
                                //           ),
                                //           TextSpan(
                                //             text: "+0.72%",
                                //             style: TextStyle(
                                //               fontSize: 18,
                                //               color: green219653,
                                //               fontFamily: "Nunito",
                                //               fontWeight: FontWeight.w400,
                                //             ),
                                //           ),
                                //           TextSpan(
                                //             text: ")",
                                //             style: TextStyle(
                                //               fontSize: 18,
                                //               color: black,
                                //               fontFamily: "Nunito",
                                //               fontWeight: FontWeight.w400,
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                ToggleScreen(green219653),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        // Divider(
                        //   thickness: 3,
                        //   color: grayF2F2F2,
                        // ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 26, bottom: 10, top: 5),
                          child: Text(
                            "Chart",
                            style: TextStyle(
                              fontSize: 18,
                              color: black,
                              fontFamily: "NunitoBold",
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 22),
                          height: 55,
                          decoration: BoxDecoration(
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff26000000).withOpacity(0.1),
                                  spreadRadius: 0.1,
                                  blurRadius: 3,
                                  // offset: Offset(0.5, 3),
                                ),
                              ],
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(14)),
                          child: TabBar(
                            labelColor: Colors.white,
                            controller: myTabController.controller5,
                            unselectedLabelColor: Colors.black,
                            indicatorColor: kPrimaryColorPink,
                            indicatorPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            indicatorWeight: 2,
                            isScrollable: false,
                            // labelPadding: EdgeInsets.only(right: 40),
                            indicator: BoxDecoration(
                              gradient: LinearGradient(
                                // Where the linear gradient begins and ends
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
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
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      kPrimaryColororangePink.withOpacity(0.1),
                                  offset: Offset(0.5, 3),
                                  blurRadius: 5,
                                  spreadRadius: 0.2,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                              color: kPrimaryColororangetoPink,
                            ),
                            tabs: myTabController.myTabs5,
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: black2,
                              fontFamily: "NunitoSemiBold",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        // Row(
                        //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,/
                        //   children: [

                        //     //todo
                        //     // Obx(
                        //     //   () => InkWell(
                        //     //     onTap: () {
                        //     //       if (colorChangeController.graphLine.isTrue ||
                        //     //           colorChangeController.graphCandle.isTrue) {
                        //     //         colorChangeController.graphLine(false);
                        //     //         colorChangeController.graphCandle(false);
                        //     //       }
                        //     //       colorChangeController.graphLine(true);
                        //     //     },
                        //     //     child: SvgPicture.asset(
                        //     //       colorChangeController.graphLine.isTrue
                        //     //           ? graph1
                        //     //           : graph1Dark,
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //     // Obx(
                        //     //   () => InkWell(
                        //     //     onTap: () {
                        //     //       if (colorChangeController.graphLine.isTrue ||
                        //     //           colorChangeController.graphCandle.isTrue) {
                        //     //         colorChangeController.graphLine(false);
                        //     //         colorChangeController.graphCandle(false);
                        //     //       }
                        //     //       colorChangeController.graphCandle(true);
                        //     //     },
                        //     //     child: SvgPicture.asset(
                        //     //         colorChangeController.graphCandle.isTrue
                        //     //             ? graph2Light
                        //     //             : graph2),
                        //     //   ),
                        //     // ),
                        //     // SvgPicture.asset(graph3),
                        //   ],
                        // ),
                        Container(
                          height: 280,
                          child: TabBarView(
                            controller: myTabController.controller5,
                            children: [
                              Obx(
                                () => Container(
                                  padding: EdgeInsets.all(8.0),
                                  width: Get.width,
                                  // height: 280,
                                  child: colorChangeController.graphLine.isTrue
                                      ? lineGraph()
                                      : MyHomePage(),
                                ),
                              ),
                              Obx(
                                () => Container(
                                  padding: EdgeInsets.all(8.0),
                                  width: Get.width,
                                  // height: 280,
                                  child: colorChangeController.graphLine.isTrue
                                      ? lineGraph()
                                      : MyHomePage(),
                                ),
                              ),
                              Obx(
                                () => Container(
                                  padding: EdgeInsets.all(8.0),
                                  width: Get.width,
                                  // height: 280,
                                  child: colorChangeController.graphLine.isTrue
                                      ? lineGraph()
                                      : MyHomePage(),
                                ),
                              ),
                              Obx(
                                () => Container(
                                  padding: EdgeInsets.all(8.0),
                                  width: Get.width,
                                  // height: 280,
                                  child: colorChangeController.graphLine.isTrue
                                      ? lineGraph()
                                      : MyHomePage(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Divider(
                        //   thickness: 3,
                        //   color: grayF2F2F2,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 14,
                            top: 12,
                            // bottom: 12
                          ),
                          child: Text(
                            "Market Depth",
                            style: TextStyle(
                              color: black2,
                              fontWeight: FontWeight.w700,
                              fontFamily: "NunitoBold",
                              fontSize: 18,
                            ),
                          ),
                        ),
                        tableView(),
                        // Divider(
                        //   thickness: 3,
                        //   color: grayF2F2F2,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buyButton(
                                textLabel: "BUY",
                                onTapButton: () {
                                  print(
                                      "................symbol   ${widget.marketsymbol}");
                                  widget.marketsymbol != null
                                      ? BlocProvider<BuySellCubit>(
                                          create: (context) => BuySellCubit(),
                                          child: buyDialog(widget.name,
                                              widget.marketsymbol, context),
                                        )
                                      : null;
                                },
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              sellButton(
                                textLabel: "SELL",
                                onTapButton: () {
                                  // sellDialog(context);
                                  widget.marketsymbol != null
                                      ? BlocProvider<BuySellCubit>(
                                          create: (context) => BuySellCubit(),
                                          child: sellDialog(widget.name,
                                              widget.marketsymbol, context),
                                        )
                                      : null;
                                },
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
          ),
        );
      },
    );
  }
}

var formkey = GlobalKey<FormState>();
String qty, order_type, marketwatchList_name, marketWatchList_Symbol, entrytype;
String price;
buyDialog(String stockName, String marketWatchListSymbol, context) {
  ProfileController profileController = Get.find();
  Dialog fancyDialog = Dialog(
    insetPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32), topRight: Radius.circular(32)),
    ),
    child: SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(CupertinoIcons.clear),
                ),
              ),
            ),
            design1Buy(stockName, color1: appColor2F80ED),
            Divider(
              thickness: 3,
              color: grayF2F2F2,
            ),
            design2(
              color2: appColor,
            ),
            design3(color2: appColor),
            Divider(
              thickness: 3,
              color: grayF2F2F2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 17, left: 17, top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Set Stoploss",
                    style: TextStyle(
                      color: black2,
                      fontWeight: FontWeight.w700,
                      fontFamily: "NunitoBold",
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Obx(
                    () => CupertinoSwitch(
                      activeColor: kPrimaryColororangetoPink,
                      value: colorChangeController.lights.value,
                      // onChanged: onchange,
                      onChanged: (bool value) {
                        colorChangeController.lights.value = value;
                        if (value) {
                          print("value....$value");
                          entrytype = "sl or sl";
                          print(entrytype);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  //kam baki
                  Visibility(
                    visible: showtextbox,
                    child: SizedBox(
                      width: Get.width / 5,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: appColor))),
                      ),
                    ),
                  )

                  // Container(
                  //   decoration: BoxDecoration(
                  //       // borderRadius: BorderRadius.all(radius)
                  //       ),
                  //   child: TextField(
                  //     keyboardType: TextInputType.number,
                  //     decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //             borderSide: BorderSide(color: appColor))),
                  //   ),
                  // ),
                ],
              ),
            ),
            Divider(
              thickness: 3,
              color: grayF2F2F2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 17, left: 17, top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Set target",
                    style: TextStyle(
                      color: black2,
                      fontWeight: FontWeight.w700,
                      fontFamily: "NunitoBold",
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 36,
                  ),
                  Obx(
                    () => CupertinoSwitch(
                      activeColor: kPrimaryColororangetoPink,
                      value: colorChangeController.lights1.value,
                      onChanged: (bool value) {
                        colorChangeController.lights1.value = value;
                        if (value == true) {
                          print("value....$value");
                          entrytype = "sl or sl";
                          print(entrytype);
                        }
                        // if (value) {
                        //   return showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return AlertDialog(
                        //         title: Text("Set Target"),
                        //         content: Container(
                        //           decoration: BoxDecoration(
                        //               // borderRadius: BorderRadius.all(radius)
                        //               ),
                        //           child: TextField(
                        //             keyboardType: TextInputType.number,
                        //             decoration: InputDecoration(
                        //                 border: OutlineInputBorder(
                        //                     borderSide:
                        //                         BorderSide(color: appColor))),
                        //           ),
                        //         ),
                        //         actions: [
                        //           TextButton(
                        //               onPressed: () {
                        //                 Navigator.pop(context);
                        //               },
                        //               child: Text("Ok",style: TextStyle(fontSize: 18),))
                        //         ],
                        //       );
                        //     },
                        //   );
                        // }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: Get.width / 5,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: appColor))),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 3,
              color: grayF2F2F2,
            ),
            Padding(
              padding: EdgeInsets.only(top: 39, bottom: 16),
              child: buyDropDownButton(
                textLabel: "BUY",
                onTapButton: () {
                  if (formkey.currentState.validate()) {
                    BlocProvider.of<BuySellCubit>(context).buySell(
                        qty,
                        order_type = "buy",
                        stockName,
                        marketWatchListSymbol,
                        entrytype,
                        price);
                  }
                  // profileController.selectedIndex.value = 1;
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DrawerOpenScreen(),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );

  return showDialog(
      context: context, builder: (BuildContext context) => fancyDialog);
}

sellDialog(String stockName, String marketWatchListSymbol, context) {
  Dialog fancyDialog = Dialog(
    insetPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32), topRight: Radius.circular(32)),
    ),
    child: SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(CupertinoIcons.clear),
                  ),
                ],
              ),
            ),
            design1Sell(color1: redEB5757),
            Divider(
              thickness: 3,
              color: grayF2F2F2,
            ),
            design2(color2: appColor),
            design3Sell(color2: appColor),
            Divider(
              thickness: 3,
              color: grayF2F2F2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 17, left: 17, top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Set Stoploss",
                    style: TextStyle(
                      color: black2,
                      fontWeight: FontWeight.w700,
                      fontFamily: "NunitoBold",
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Obx(
                    () => CupertinoSwitch(
                      activeColor: redEB5757,
                      value: colorChangeController.lights.value,
                      onChanged: (bool value) {
                        colorChangeController.lights.value = value;
                         if (value == true) {
                          print("value....$value");
                          entrytype = "sl or sl";
                          print(entrytype);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 3,
              color: grayF2F2F2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 17, left: 17, top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Set target",
                    style: TextStyle(
                      color: black2,
                      fontWeight: FontWeight.w700,
                      fontFamily: "NunitoBold",
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 36,
                  ),
                  Obx(
                    () => CupertinoSwitch(
                      activeColor: redEB5757,
                      value: colorChangeController.lights1.value,
                      onChanged: (bool value) {
                        colorChangeController.lights1.value = value;
                       
                       
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 3,
              color: grayF2F2F2,
            ),
            Padding(
              padding: EdgeInsets.only(top: 39, bottom: 16),
              child: sellDropDownButton(
                onTapButton: () {
                  if (formkey.currentState.validate()) {
                    BlocProvider.of<BuySellCubit>(context).buySell(
                        qty,
                        order_type = "sell",
                        stockName,
                        marketWatchListSymbol,
                        entrytype,
                        price);
                  }
                },
                textLabel: "SELL",
              ),
            ),
          ],
        ),
      ),
    ),
  );
  return showDialog(
      context: context, builder: (BuildContext context) => fancyDialog);
}

tableView() {
  return Padding(
    padding: const EdgeInsets.only(top: 14, bottom: 14),
    child: Table(
      // defaultColumnWidth: FixedColumnWidth(120),
      children: [
        TableRow(children: [
          Column(children: [
            Text(
              'Bid',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: black,
              ),
            )
          ]),
          Column(children: [
            Text(
              'Offer',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: black2,
              ),
            )
          ]),
          Column(children: [
            Text(
              'Qty',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: black2,
              ),
            )
          ]),
          Column(children: [
            Text(
              'Offer',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: black2,
              ),
            )
          ]),
          Column(children: [
            Text(
              'Order',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: black2,
              ),
            )
          ]),
          Column(children: [
            Text(
              'Qty',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: black2,
              ),
            )
          ]),
        ]),
        TableRow(children: [
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
        ]),
        TableRow(children: [
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
        ]),
        TableRow(children: [
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
        ]),
        TableRow(children: [
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            ),
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
        ]),
        TableRow(children: [
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
        ]),
        TableRow(children: [
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
        ]),
        TableRow(children: [
          Column(children: [
            Text(
              'Total',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: green,
              ),
            )
          ]),
          Column(children: [
            Text(
              'Total',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w400,
                color: redEB5757,
              ),
            )
          ]),
          Column(children: [
            Text(
              '0.00',
              style: TextStyle(
                fontSize: 11.0,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w600,
                color: redEB5757,
              ),
            )
          ]),
        ]),
      ],
    ),
  );
}

lineGraph() {
  return LineChart(
    LineChartData(
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: 8,
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: black,
              fontWeight: FontWeight.w600,
              fontFamily: "Nunito",
              fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '·11am';
              case 2:
                return '.12am';
              case 3:
                return '·1pm';
              case 4:
                return '·2pm';
              case 5:
                return '·3pm';
              case 6:
                return '.03.45.09pm';
            }
            return '';
          },
          margin: -19,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: black,
              fontWeight: FontWeight.w600,
              fontFamily: "Nunito",
              fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '0';
              case 2:
                return '150';
              case 3:
                return '250';
              case 4:
                return '350';
              case 5:
                return '500';
              case 6:
                return '650';
              case 7:
                return '750';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      gridData: FlGridData(
        show: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Color(0xffD6D9DC),
            strokeWidth: 1,
          );
        },
        drawVerticalLine: false,
        /* getDrawingVerticalLine: (value) {
                          return FlLine(
                            color: Color(0xffD6D9DC),
                            strokeWidth: 1,
                          );
                        },*/
      ),
      lineBarsData: [
        LineChartBarData(
          dotData: FlDotData(show: true),
          spots: [
            FlSpot(0, 5),
            FlSpot(1, 4),
            FlSpot(2.5, 6),
            FlSpot(3.5, 5),
            FlSpot(4.5, 2),
            FlSpot(6.5, 4.5),
            FlSpot(7, 2.5),
          ],
          isCurved: true,
          barWidth: 2,
          colors: [
            green,
          ],
        ),
        LineChartBarData(
          dotData: FlDotData(
            show: true,
          ),
          spots: [
            FlSpot(0, 4),
            FlSpot(1, 4.9),
            FlSpot(2.5, 2),
            FlSpot(3.5, 3),
            FlSpot(4.5, 3.4),
            FlSpot(6.5, 3.5),
            FlSpot(7, 3.9),
          ],
          isCurved: true,
          barWidth: 2,
          colors: [
            kPrimaryColorOrange,
            kPrimaryColororangePink,
            kPrimaryColororangetoPink,
            kPrimaryColorPink,
          ],
        ),
      ],
    ),
  );
}

design1({color1}) {
  return Padding(
    padding: const EdgeInsets.only(left: 17, right: 17, bottom: 17),
    child: Container(
      width: Get.width,
      height: /*Get.height/ 15.91*/ 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "AXISBANK",
                style: TextStyle(
                  fontSize: 18,
                  color: black2,
                  fontFamily: "NunitoBold",
                  fontWeight: FontWeight.w700,
                ),
              ),
              ToggleScreen(color1),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹2126.20",
                style: TextStyle(
                  fontSize: 18,
                  color: color1,
                  fontFamily: "NunitoBold",
                  fontWeight: FontWeight.w700,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "+30.00",
                      style: TextStyle(
                        fontSize: 13,
                        color: black,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "(",
                      style: TextStyle(
                        fontSize: 18,
                        color: black,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "+0.72%",
                      style: TextStyle(
                        fontSize: 13,
                        color: color1,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ")",
                      style: TextStyle(
                        fontSize: 18,
                        color: black,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

design1Buy(String stockname, {color1}) {
  return Padding(
    padding: const EdgeInsets.only(left: 17, right: 17, bottom: 17),
    child: Container(
      width: Get.width,
      height: /*Get.height/ 15.91*/ 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // "AXISBANK",
                stockname,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontFamily: "NunitoBold",
                  fontWeight: FontWeight.w700,
                ),
              ),
              ToggleScreenBuy(green219653),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹2126.20",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "+30.00",
                      style: TextStyle(
                        fontSize: 13,
                        color: gray9B9797,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "(",
                      style: TextStyle(
                        fontSize: 18,
                        color: gray9B9797,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "+0.72%",
                      style: TextStyle(
                        fontSize: 13,
                        color: gray9B9797,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ")",
                      style: TextStyle(
                        fontSize: 18,
                        color: gray9B9797,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

design1Sell({color1}) {
  return Padding(
    padding: const EdgeInsets.only(left: 17, right: 17, bottom: 17),
    child: Container(
      width: Get.width,
      height: /*Get.height/ 15.91*/ 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "AXISBANK",
                style: TextStyle(
                  fontSize: 18,
                  color: black2,
                  fontFamily: "NunitoBold",
                  fontWeight: FontWeight.w700,
                ),
              ),
              ToggleScreenSell(color1),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹2126.20",
                style: TextStyle(
                  fontSize: 18,
                  color: color1,
                  fontFamily: "NunitoBold",
                  fontWeight: FontWeight.w700,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "+30.00",
                      style: TextStyle(
                        fontSize: 13,
                        color: black,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "(",
                      style: TextStyle(
                        fontSize: 18,
                        color: black,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "+0.72%",
                      style: TextStyle(
                        fontSize: 13,
                        color: color1,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ")",
                      style: TextStyle(
                        fontSize: 18,
                        color: black,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

design2({color2}) {
  return Padding(
    padding: EdgeInsets.only(
        left: Get.width / 24.20 /* 17*/,
        right: Get.width / 24.20 /*17*/,
        top: 17),
    child: Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Quantity",
                style: TextStyle(
                  fontSize: 13,
                  color: gray4,
                  fontFamily: "NunitoSemiBold",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 31,
                width: Get.width / 4.37 /*94*/,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Color(0xff66000000),
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    } else {
                      qty = value;
                    }
                  },
                  textAlign: TextAlign.start,
                  cursorColor: black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Prise",
                style: TextStyle(
                  fontSize: 13,
                  color: gray4,
                  fontFamily: "NunitoSemiBold",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 31,
                width: Get.width / 4.37 /* 94*/,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Color(0xff66000000),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    // "₹2126.20",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required";
                      } else {
                        price = value;
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 13,
                      color: black,
                      fontFamily: "NunitoBold",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order",
                style: TextStyle(
                  fontSize: 13,
                  color: gray4,
                  fontFamily: "NunitoSemiBold",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 31,
                width: Get.width / 4.37 /*94*/,
                padding: EdgeInsets.only(left: 10),
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
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: Obx(
                      () => DropdownButton<String>(
                        dropdownColor: kPrimaryColororangetoPink,
                        // menuMaxHeight: 40,
                        // itemHeight: 20,
                        isDense: true,
                        value: myTabController.selectedValue.value,
                        focusColor: red,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.red,
                          fontFamily: "NunitoBold",
                          fontWeight: FontWeight.w700,
                        ),
                        autofocus: true,
                        elevation: 0,
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: white,
                        ),
                        // isDense: true,
                        items: myTabController.dropList.map((e) {
                          return DropdownMenuItem(
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize: 13,
                                color: white,
                                fontFamily: "NunitoBold",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          myTabController.setSelected(val);
                          print(val);
                          if (val.isEmpty || val == null) {
                            return "required";
                          }
                          order_type = val;
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

design3({color2}) {
  return Padding(
    padding: EdgeInsets.only(
        left: Get.width / 24.20 /*17*/,
        right: Get.width / 24.20 /*17*/,
        top: 17,
        bottom: 20),
    child: Container(
      height: 60,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mode",
                style: TextStyle(
                  fontSize: 13,
                  color: gray4,
                  fontFamily: "NunitoSemiBold",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 31,
                width: Get.width / 4.37 /*94*/,
                padding: EdgeInsets.only(left: 10),
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
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    "Intraday",
                    style: TextStyle(
                      fontSize: 13,
                      color: white,
                      fontFamily: "NunitoSemiBold",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                /* child: TextField(
                  textAlign: TextAlign.start,
                  cursorColor: black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),*/
              ),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 31,
                width: Get.width / 4.37 /*94*/,
                // padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Color(0xff66000000),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Delivery",
                    style: TextStyle(
                      fontSize: 13,
                      color: gray4,
                      fontFamily: "NunitoSemiBold",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     // Text(
          //     //   "Validity",
          //     //   style: TextStyle(
          //     //     fontSize: 13,
          //     //     color: gray4,
          //     //     fontFamily: "NunitoSemiBold",
          //     //     fontWeight: FontWeight.w600,
          //     //   ),
          //     // ),
          //     // Container(
          //     //   height: 31,
          //     //   width: Get.width / 4.37 /*94*/,
          //     //   padding: EdgeInsets.only(left: 10),
          //     //   decoration: BoxDecoration(
          //     //     gradient: LinearGradient(
          //     //       stops: [0.1, 0.3, 0.7, 0.8],
          //     //       colors: [
          //     //         kPrimaryColorOrange,
          //     //         kPrimaryColororangePink,
          //     //         kPrimaryColororangetoPink,
          //     //         kPrimaryColorPink,
          //     //       ],
          //     //       begin: Alignment.topRight,
          //     //       end: Alignment.topLeft,
          //     //     ),
          //     //     borderRadius: BorderRadius.circular(100),
          //     //   ),
          //     //   child: Center(
          //     //     child: DropdownButtonHideUnderline(
          //     //       child: Obx(
          //     //         () => DropdownButton<String>(
          //     //           dropdownColor: kPrimaryColororangetoPink,
          //     //           // menuMaxHeight: 40,
          //     //           // itemHeight: 20,
          //     //           isDense: true,
          //     //           value: myTabController.selectedValue1.value,
          //     //           focusColor: appColor,
          //     //           style: TextStyle(
          //     //             fontSize: 13,
          //     //             color: Colors.red,
          //     //             fontFamily: "NunitoBold",
          //     //             fontWeight: FontWeight.w700,
          //     //           ),
          //     //           autofocus: true,
          //     //           elevation: 0,
          //     //           icon: Icon(
          //     //             Icons.keyboard_arrow_down_outlined,
          //     //             color: white,
          //     //           ),
          //     //           // isDense: true,
          //     //           items: myTabController.dropList1.map((e) {
          //     //             return DropdownMenuItem(
          //     //               child: Text(
          //     //                 e,
          //     //                 style: TextStyle(
          //     //                   fontSize: 13,
          //     //                   color: white,
          //     //                   fontFamily: "NunitoBold",
          //     //                   fontWeight: FontWeight.w700,
          //     //                 ),
          //     //               ),
          //     //               value: e,
          //     //             );
          //     //           }).toList(),
          //     //           onChanged: (val) {
          //     //             myTabController.setSelected1(val);
          //     //           },
          //     //         ),
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ),
          //   ],
          // ),
        ],
      ),
    ),
  );
}

design3Sell({color2}) {
  return Padding(
    padding: EdgeInsets.only(
        left: Get.width / 24.20 /*17*/,
        right: Get.width / 24.20 /*17*/,
        top: 17,
        bottom: 20),
    child: Container(
      height: 60,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mode",
                style: TextStyle(
                  fontSize: 13,
                  color: gray4,
                  fontFamily: "NunitoSemiBold",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 31,
                width: Get.width / 4.37 /*94*/,
                padding: EdgeInsets.only(left: 10),
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
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    "Intraday",
                    style: TextStyle(
                      fontSize: 13,
                      color: white,
                      fontFamily: "NunitoSemiBold",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                /* child: TextField(
                  textAlign: TextAlign.start,
                  cursorColor: black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),*/
              ),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 31,
                width: Get.width / 4.37 /*94*/,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Color(0xff66000000),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Delivery",
                    style: TextStyle(
                      fontSize: 13,
                      color: gray4,
                      fontFamily: "NunitoSemiBold",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       "Validity",
          //       style: TextStyle(
          //         fontSize: 13,
          //         color: gray4,
          //         fontFamily: "NunitoSemiBold",
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //     Container(
          //       height: 31,
          //       width: Get.width / 4.37 /*94*/,
          //       padding: EdgeInsets.only(left: 10),
          //       decoration: BoxDecoration(
          //         color: color2,
          //         borderRadius: BorderRadius.circular(100),
          //       ),
          //       child: Center(
          //         child: DropdownButtonHideUnderline(
          //           child: Obx(
          //             () => DropdownButton<String>(
          //               // menuMaxHeight: 40,
          //               // itemHeight: 20,
          //               isDense: true,
          //               value: myTabController.selectedValue1.value,
          //               focusColor: appColor,
          //               style: TextStyle(
          //                 fontSize: 13,
          //                 color: Colors.red,
          //                 fontFamily: "NunitoBold",
          //                 fontWeight: FontWeight.w700,
          //               ),
          //               autofocus: true,
          //               elevation: 0,
          //               icon: Icon(
          //                 Icons.keyboard_arrow_down_outlined,
          //                 color: white,
          //               ),
          //               // isDense: true,
          //               items: myTabController.dropList1.map((e) {
          //                 return DropdownMenuItem(
          //                   child: Text(
          //                     e,
          //                     style: TextStyle(
          //                       fontSize: 13,
          //                       color: black,
          //                       fontFamily: "NunitoBold",
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                   value: e,
          //                 );
          //               }).toList(),
          //               onChanged: (val) {
          //                 myTabController.setSelected1(val);
          //               },
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    ),
  );
}

List sampleData = [
  {"open": 50.0, "high": 100.0, "low": 40.0, "close": 80, "volumeto": 5000.0},
  {"open": 80.0, "high": 90.0, "low": 55.0, "close": 65, "volumeto": 4000.0},
  {"open": 65.0, "high": 120.0, "low": 60.0, "close": 90, "volumeto": 7000.0},
  {"open": 90.0, "high": 95.0, "low": 85.0, "close": 80, "volumeto": 2000.0},
  {"open": 80.0, "high": 85.0, "low": 40.0, "close": 50, "volumeto": 3000.0},
];
