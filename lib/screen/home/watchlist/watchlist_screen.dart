// ignore_for_file: missing_return

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/bloc/_buy_selll/buy_sell_cubit.dart';
import 'package:mymoney/bloc/_search/search_cubit.dart';
import 'package:mymoney/bloc/_watchlist/watchlist_cubit.dart';
import 'package:mymoney/bloc/_watchlist/watchlist_state.dart';
import 'package:mymoney/constant.dart';
import 'package:mymoney/controller/tabcontroller_screen.dart';
import 'package:mymoney/model/user_model.dart';
import 'package:mymoney/screen/home/watchlist/buy_sell_screen.dart';
import 'package:mymoney/screen/home/watchlist/search_screen.dart';
import 'package:mymoney/screen/home/watchlist/toggle_design_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/data.dart';

import '../../../bloc/_auth/auth_cubit.dart';
import '../../../bloc/_auth/auth_state.dart' as AuthState;
import '../../../controller/conteiner_color_change_keypade.dart';
import '../../../model/watchlist_model.dart';

final MyTabController myTabController = Get.put(MyTabController());
ColorChangeController colorChangeController = Get.put(
  ColorChangeController(),
);

class WatchListScreen extends StatefulWidget {
  static const String _baseUrl =
      'http://192.168.0.166:3000/nse/get_quote_info?companyName=TCS,ALEMBICLTD,FINCABLES,WIPRO';

  static const String _apiKey = 'P97NOWRAYZORLCY8';

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  final MyTabController myTabController = Get.put(MyTabController());

  List<WatchListModel> watchListmodel = [];
  int selectedTabId, selected_index = 0;
  User userdata;

  /*final dhanApi = DhanApi(
    apiKey: 'YOUR_API_KEY',
    apiSecret: 'YOUR_API_SECRET',
  );*/
  @override
  Widget build(BuildContext context) {
    int id;
    userdata =
        ((BlocProvider.of<AuthCubit>(context).state as AuthState.Authenticated)
            .userdata);

    return Scaffold(
      // appBar: appBarDesign(() {}),
      body: SingleChildScrollView(
        child: BlocConsumer<WatchListCubit, WatchListState>(
          listener: (context, state) {
            //todo
          },
          builder: (context, state) {
            if (state is Init) {
              BlocProvider.of<WatchListCubit>(context)
                  .loadMarketwatch(userdata.id.toString(), selected_index);
            }
            if (state is Deleted) {
              BlocProvider.of<WatchListCubit>(context)
                  .loadWatchList(selectedTabId);
            }

            return DefaultTabController(
              length: state is Loaded ? state.marketList.length : 1,
              child: Column(
                children: [
                  Container(
                    // height: 10,
                    decoration: BoxDecoration(
                      // Box decoration takes a gradient
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
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
                    // child: Align(
                    //   alignment: Alignment.topRight,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //         right: Get.width / 20.57, top: Get.height / 178.28),
                    //     child: InkWell(
                    //       onTap: () {
                    //         Get.to(NotificationScreen());
                    //       },
                    //       child: SvgPicture.asset(
                    //         bellhome,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ),
                  Container(
                    height: Get.height / 4.7,
                    child: header(),

                    // child: TabBarView(
                    //   controller: myTabController.controller,
                    //   children: [
                    //     tabView1(),
                    //     tabView1(),
                    //     tabView1(),
                    //     tabView1(),
                    //     tabView1(),
                    //   ],
                    // ),
                  ),
                  state is Loaded
                      ? Container(
                          margin: EdgeInsets.only(
                              top: 8, right: 8, left: 8, bottom: 0),
                          height: 30,
                          width: Get.width,
                          child: TabBar(
                            labelColor: kPrimaryColorPink,
                            indicatorPadding: EdgeInsets.zero,
                            labelPadding: EdgeInsets.zero,
                            onTap: (index) {
                              //  update selected tab index and get the ID for the selected tab
                              //   BlocProvider.of<WatchListCubit>(context).loadMarketwatch(userdata.id.toString(), index);
                              setState(() {
                                selected_index = index;
                                selectedTabId =
                                    state.marketList[selected_index].id;
                                BlocProvider.of<WatchListCubit>(context)
                                    .loadWatchList(selectedTabId);
                                print('Selected Tab ID: $selectedTabId');
                              });
                            },
                            // controller: myTabController.controller,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: kPrimaryColorPink,
                            indicatorSize: TabBarIndicatorSize.label,
                            isScrollable: false,
                            // tabs: myTabController.myTabs,
                            tabs:
                                List.generate(state.marketList.length, (index) {
                              return Tab(
                                text: state.marketList[index].marketWatchName,
                              );
                            }),
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: black,
                              fontFamily: "NunitoSemiBold",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                  Container(
                    height: Get.height,
                    // child: tabView1(),
                    child: state is Loaded
                        ? TabBarView(
                            // children:<Widget>[
                            //   ...state.marketList.map((data) {
                            //     return selected_index<state.marketList.length? tabView1(state, context,
                            //                 id = state.marketList[selected_index].id):[];
                            //   }).toList(),]

                            // controller: myTabController.controller,
                            children: List.generate(
                                //todo
                                state.marketList.length,
                                (index) => tabView1(state, context,
                                    id = state.marketList[index].id))

                            // [
                            //   tabView1(state),
                            //   tabView1(state),
                            //   // tabView1(state),
                            //   // tabView1(state),
                            //   // tabView1(state),
                            // ],
                            )
                        : SizedBox(),
                  ),
                  // SizedBox(
                  //   height: Get.height / 44.57,
                  // ),
                  // Container(
                  //   height:
                  //       Get.height * 1.2 /*(Get.height > 891) ? Get.height : 275*/,
                  //   width: Get.width,
                  //   decoration: BoxDecoration(
                  //     color: grayF2F2F2,
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(20),
                  //       topRight: Radius.circular(20),
                  //     ),
                  //   ),
                  //   //   //todo
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             right: Get.width / 31.64,
                  //             top: Get.height / 89.14,
                  //             left: Get.width / 31.64),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               "Stocks",
                  //               style: TextStyle(
                  //                 fontSize: 18,
                  //                 color: kPrimaryColorPink,
                  //                 fontFamily: "NunitoBold",
                  //                 fontWeight: FontWeight.w700,
                  //               ),
                  //             ),
                  //             TextButton(
                  //               onPressed: () {
                  //                 Navigator.push(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                     builder: (context) => AllStockScreen(),
                  //                   ),
                  //                 );
                  //               },
                  //               child: Text(
                  //                 "See All",
                  //                 style: TextStyle(
                  //                   fontSize: 15,
                  //                   color: kPrimaryColorPink,
                  //                   fontFamily: "NunitoSemiBold",
                  //                   fontWeight: FontWeight.w600,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       /* ListView.builder(
                  //         padding: EdgeInsets.only(top: 10),
                  //         shrinkWrap: true,
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount: watchListPageBuildDesign.length,
                  //         itemBuilder: (context, index) => listViewItemDesign(
                  //           context: context,
                  //           image: watchListPageBuildDesign[index]["img"],
                  //           title: watchListPageBuildDesign[index]["title"],
                  //           subTitle: watchListPageBuildDesign[index]["subTitle"],
                  //           total: watchListPageBuildDesign[index]["totalRs"],
                  //           stock1: watchListPageBuildDesign[index]["stock1"],
                  //           stock2: watchListPageBuildDesign[index]["stock2"],
                  //           colorName: watchListPageBuildDesign[index]["color"],
                  //         ),
                  //       ),*/
                  //       // StreamBuilder(
                  //           //stream: getStockData("all"),
                  //       //     builder: (context,
                  //       //         AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  //         //print(snapshot.data.keys);
                  //         // var data = snapshot.data['data'];

                  //         /* if (snapshot.connectionState ==
                  //                 ConnectionState.waiting) {
                  //               return Center(
                  //                 child: CircularProgressIndicator(),
                  //               );
                  //             } else if (snapshot.hasError) {
                  //               return Center(
                  //                 child: Text('Error: ${snapshot.error}'),
                  //               );
                  //             } else {*/

                  //             //stocks
                  //         // return ListView.builder(
                  //         //   padding: EdgeInsets.only(top: 10),
                  //         //   shrinkWrap: true,
                  //         //   physics: NeverScrollableScrollPhysics(),
                  //         //   itemCount: watchListPageBuildDesign.length,
                  //         //   itemBuilder: (context, index) =>
                  //         //       // var item = snapshot.data[index];
                  //         //       Dismissible(
                  //         //     key: Key(watchListPageBuildDesign[index]["title"]),
                  //         //     onDismissed: (direction) {
                  //         //       // Implement your swipe to action logic here
                  //         //       // You can remove the item from the list or show an undo option
                  //         //     },
                  //         //     confirmDismiss: (direction) async {
                  //         //       if (direction == DismissDirection.endToStart) {
                  //         //         // Display an alert for the delete action
                  //         //         final bool res = await showDialog(
                  //         //           context: context,
                  //         //           builder: (BuildContext context) {
                  //         //             return AlertDialog(
                  //         //               title: const Text("Confirm"),
                  //         //               content: const Text(
                  //         //                   "Are you sure you wish to archive this item?"),
                  //         //               actions: <W`id`get>[
                  //         //                 TextButton(
                  //         //                     onPressed: () =>
                  //         //                         Navigator.of(context).pop(true),
                  //         //                     child: const Text("ARCHIVE")),
                  //         //                 TextButton(
                  //         //                   onPressed: () =>
                  //         //                       Navigator.of(context).pop(false),
                  //         //                   child: const Text("CANCEL"),
                  //         //                 ),
                  //         //               ],
                  //         //             );
                  //         //           },
                  //         //         );
                  //         //         return res;
                  //         //       } else if (direction == DismissDirection.startToEnd) {
                  //         //         // Display an alert for the archive action
                  //         //         final bool res = await showDialog(
                  //         //           context: context,
                  //         //           builder: (BuildContext context) {
                  //         //             return AlertDialog(
                  //         //               title: const Text("Archive"),
                  //         //               content: const Text(
                  //         //                   "Are you sure you wish to delete this item?"),
                  //         //               actions: <Widget>[
                  //         //                 TextButton(
                  //         //                     onPressed: () =>
                  //         //                         Navigator.of(context).pop(true),
                  //         //                     child: const Text("DELETE")),
                  //         //                 TextButton(
                  //         //                   onPressed: () =>
                  //         //                       Navigator.of(context).pop(false),
                  //         //                   child: const Text("CANCEL"),
                  //         //                 ),
                  //         //               ],
                  //         //             );
                  //         //           },
                  //         //         );
                  //         //         return res;
                  //         //       }
                  //         //     },
                  //         //     background: Container(
                  //         //       color: Colors.red,
                  //         //       // Customize the background color
                  //         //       child: Align(
                  //         //         alignment: Alignment.centerRight,
                  //         //         child: Icon(
                  //         //           Icons.delete,
                  //         //           color: Colors.white,
                  //         //         ),
                  //         //       ),
                  //         //     ),
                  //         //     secondaryBackground: Container(
                  //         //       color: Colors.green,
                  //         //       // Customize the background color
                  //         //       child: Align(
                  //         //         alignment: Alignment.centerLeft,
                  //         //         child: Icon(
                  //         //           Icons.archive,
                  //         //           color: Colors.white,
                  //         //         ),
                  //         //       ),
                  //         //     ),
                  //         //     //           // var item = snapshot.data[index];
                  //         //     /*child: listViewItemDesign(
                  //         //                 context: context,
                  //         //                 image: watchList[index].img,
                  //         //                 title: watchList[index].title,
                  //         //                 subTitle: watchList[index].subTitle,
                  //         //                 total: watchList[index].lastPrice.toString(),
                  //         //                 stock1: watchList[index].basePrice.toStringAsFixed(3),
                  //         //                 stock2: watchList[index].pChange,
                  //         //                 colorName: Colors.red,
                  //         //               ),*/
                  //         //     child: listViewItemDesign(
                  //         //       context: context,
                  //         //       image: watchListPageBuildDesign[index]["img"],
                  //         //       title: watchListPageBuildDesign[index]["title"],
                  //         //       subTitle: watchListPageBuildDesign[index]["subTitle"],
                  //         //       total: watchListPageBuildDesign[index]["totalRs"],
                  //         //       stock1: watchListPageBuildDesign[index]["stock1"],
                  //         //       stock2: watchListPageBuildDesign[index]["stock2"],
                  //         //       colorName: Colors.red,
                  //         //     ),
                  //         //   ),
                  //         // );

                  //         //       //}
                  //       }),
                  /*ListView.builder(
                          padding: EdgeInsets.only(top: 10),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: watchList.length,
                          itemBuilder: (context, index)  => Dismissible(
                            key: Key(watchList[index].title),
                            onDismissed: (direction) {

                              // Implement your swipe to action logic here
                              // You can remove the item from the list or show an undo option
                            },
                            confirmDismiss: (direction) async {
                              if (direction == DismissDirection.endToStart) {
                                // Display an alert for the delete action
                                final bool res = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirm"),
                                      content: const Text("Are you sure you wish to delete this item?"),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () => Navigator.of(context).pop(true),
                                            child: const Text("DELETE")),
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(false),
                                          child: const Text("CANCEL"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return res;
                              } else if (direction == DismissDirection.startToEnd) {
                                // Display an alert for the archive action
                                final bool res = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Archive"),
                                      content: const Text("Are you sure you wish to archive this item?"),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () => Navigator.of(context).pop(true),
                                            child: const Text("ARCHIVE")),
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(false),
                                          child: const Text("CANCEL"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return res;
                              }
                            },
                            background: Container(
                              color: Colors.red, // Customize the background color
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            secondaryBackground: Container(
                              color: Colors.green, // Customize the background color
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.archive,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: listViewItemDesign(
                              context: context,
                              image: watchList[index].img,
                              title: watchList[index].title,
                              subTitle: watchList[index].subTitle,
                              total: watchList[index].basePrice,
                              stock1: watchList[index].previousClose,
                              stock2:  watchList[index].lastPrice,
                              colorName: Colors.red,
                            ),
                          ),
                        ),*/
                  // Padding(
                  //   padding: EdgeInsets.only(top: 14),
                  //   child: Divider(
                  //     height: 2,
                  //     thickness: 2,
                  //     color: grayF2F2F2,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       right: Get.width / 31.64, left: Get.width / 31.64),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Most Active Stock",
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           color: black0D1F3C,
                  //           fontFamily: "NunitoBold",
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //       TextButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) =>
                  //                   MostActiveAllStocksScreen(),
                  //             ),
                  //           );
                  //         },
                  //         child: Text(
                  //           "See All",
                  //           style: TextStyle(
                  //             fontSize: 15,
                  //             color: kPrimaryColorPink,
                  //             fontFamily: "NunitoSemiBold",
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //most active stocks
                  //   ListView.builder(
                  //     padding: EdgeInsets.only(top: 0),
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemCount: watchListPageBuildDesignMostStock.length,
                  //     itemBuilder: (context, index) =>
                  //         listViewItemDesignMostStock(
                  //       context: context,
                  //       image: watchListPageBuildDesignMostStock[index]["img"],
                  //       title: watchListPageBuildDesignMostStock[index]["title"],
                  //       subTitle: watchListPageBuildDesignMostStock[index]
                  //           ["subTitle"],
                  //       total: watchListPageBuildDesignMostStock[index]
                  //           ["totalRs"],
                  //       stock1: watchListPageBuildDesignMostStock[index]
                  //           ["stock1"],
                  //       stock2: watchListPageBuildDesignMostStock[index]
                  //           ["stock2"],
                  //       colorName: watchListPageBuildDesignMostStock[index]
                  //           ["color"],
                  //     ),
                  //   ),
                  //   Padding(
                  //     padding: EdgeInsets.only(
                  //         right: Get.width / 31.64, left: Get.width / 31.64),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           "Recent Visited Stocks",
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             color: black0D1F3C,
                  //             fontFamily: "NunitoBold",
                  //             fontWeight: FontWeight.w700,
                  //           ),
                  //         ),
                  //         TextButton(
                  //           onPressed: () {
                  //             /*  Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => AllStockScreen(),
                  //               ),
                  //             );*/
                  //           },
                  //           child: Text(
                  //             "See All",
                  //             style: TextStyle(
                  //               fontSize: 15,
                  //               color: kPrimaryColorPink,
                  //               fontFamily: "NunitoSemiBold",
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   Container(
                  //     margin: EdgeInsets.only(
                  //       left: 6.5,
                  //       right: 6.5,
                  //       bottom: Get.height / 99.04,
                  //     ),
                  //     padding: EdgeInsets.only(
                  //       left: 5,
                  //       right: 5,
                  //       top: 9,
                  //       bottom: 9,
                  //     ),
                  //     height: 62,
                  //     // width: Get.width,
                  //     decoration: BoxDecoration(
                  //       color: pageBackGroundC,
                  //       borderRadius: BorderRadius.circular(12),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Color(0xff26000000).withOpacity(0.1),
                  //           spreadRadius: 0.1,
                  //           blurRadius: 3,
                  //           offset: Offset(0.5, 3),
                  //         ),
                  //       ],
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         lastContainerDesign(
                  //           text1: "TCS",
                  //           mainColor: redEB5757,
                  //           text2: "215.15",
                  //           richText1: "+13.00",
                  //           richText2: "+0.14%",
                  //         ),
                  //         lastContainerDesign(
                  //           text1: "WIPRO",
                  //           mainColor: green219653,
                  //           text2: "456.40",
                  //           richText1: "+13.00",
                  //           richText2: "+0.01%",
                  //         ),
                  //         lastContainerDesign(
                  //           text1: "SUNPHARMA",
                  //           mainColor: green219653,
                  //           text2: "895.78",
                  //           richText1: "+52.00",
                  //           richText2: "+2.52%",
                  //         ),
                  //         lastContainerDesign(
                  //           text1: "CIPLA",
                  //           mainColor: redEB5757,
                  //           text2: "1454.78",
                  //           richText1: "+15.00",
                  //           richText2: "+5.52%",
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ],
                  //   // ),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

final List<Color> gradientColorsgreen = [
  const Color(0xff73BE8C),
  const Color(0xff73BE8C),
];

final List<Color> gradientColorsred = [
  Color.fromARGB(255, 214, 36, 36),
  Color.fromARGB(255, 214, 36, 36),
];

final List<Color> gradientColorswhite = [
  const Color(0xffEDF1F9),
  const Color(0xffEDF1F9),
];

lastContainerDesign(
    {String text1,
    Color mainColor,
    String text2,
    String richText1,
    String richText2}) {
  return Container(
    // width: 82 /*tablet:80*/,
    child: Row(
      children: [
        VerticalDivider(
          color: mainColor,
          thickness: 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: 9,
                color: black3B3C59,
                fontFamily: "NunitoBold",
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 12,
                color: mainColor,
                fontFamily: "NunitoSemiBold",
                fontWeight: FontWeight.w600,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: richText1,
                    style: TextStyle(
                      fontSize: 8,
                      color: black080D0A,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "(",
                    style: TextStyle(
                      fontSize: 8,
                      color: black080D0A,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: richText2,
                    style: TextStyle(
                      fontSize: 8,
                      color: mainColor,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: ")",
                    style: TextStyle(
                      fontSize: 8,
                      color: black080D0A,
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
  );
}

header() {
  return Container(
    padding: EdgeInsets.only(top: 55),
    decoration: BoxDecoration(
      // Box decoration takes a gradient
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.1, 0.3, 0.5, 0.8],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          kPrimaryColorOrange,
          kPrimaryColororangePink,
          kPrimaryColororangetoPink,
          kPrimaryColorPink,
        ],
      ),
    ),
    child: Row(
      children: [
        SizedBox(
          width: Get.width / 17,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "NIFTY 50",
              style: TextStyle(
                fontSize: 24,
                color: white,
                fontFamily: "NunitoSemiBold",
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "24,825.90",
              style: TextStyle(
                fontSize: 24,
                color: white,
                fontFamily: "NunitoBold",
                fontWeight: FontWeight.w400,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "+13.00",
                    style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "(",
                    style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "+0.14%",
                    style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: ")",
                    style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 24),
            //   child: SizedBox(
            //     height: Get.height / 5.57,
            //     child: LineChart(
            //       LineChartData(
            //         minX: 0,
            //         maxX: 11,
            //         minY: 0,
            //         maxY: 6,
            //         titlesData: FlTitlesData(show: false),

            //         // showingTooltipIndicators: true,
            //         // titlesData: LineTitles.getTitleData(),
            //         gridData: FlGridData(
            //           show: false,
            //           // getDrawingHorizontalLine: (value) {
            //           //   return FlLine(
            //           //     color: transPrent,
            //           //     strokeWidth: 1,
            //           //   );
            //           // },
            //           drawVerticalLine: false,
            //           // getDrawingVerticalLine: (value) {
            //           //   return FlLine(
            //           //     color: transPrent,
            //           //     strokeWidth: 1,
            //           //   );
            //           // },
            //         ),
            //         borderData: FlBorderData(
            //           show: false,
            //           // border: Border.all(color: transPrent, width: 1),
            //         ),
            //         lineBarsData: [
            //           LineChartBarData(
            //             spots: [
            //               FlSpot(0, 3),
            //               FlSpot(2.6, 2),
            //               FlSpot(4.9, 5),
            //               FlSpot(6.8, 2.5),
            //               FlSpot(8, 4),
            //               FlSpot(9.5, 3),
            //               FlSpot(11, 4),
            //             ],
            //             isCurved: true,
            //             colors: gradientColorswhite,
            //             barWidth: 2,
            //             dotData: FlDotData(show: true),

            //             // belowBarData: BarAreaData(
            //             //     // show: true,
            //             //     // colors: gradientColors
            //             //     //     .map((color) => color.withOpacity(0.3))
            //             //     //     .toList(),
            //             //     ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        Spacer(),
        // SizedBox(
        //   width: Get.width / 17,
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "NIFTY BANK",
              style: TextStyle(
                fontSize: 24,
                color: white,
                fontFamily: "NunitoSemiBold",
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "24,825.90",
              style: TextStyle(
                fontSize: 24,
                color: white,
                fontFamily: "NunitoBold",
                fontWeight: FontWeight.w400,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "+13.00",
                    style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "(",
                    style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "+0.14%",
                    style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: ")",
                    style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 28),
            //   child: SizedBox(
            //     height: Get.height / 5.57,
            //     child: LineChart(
            //       LineChartData(
            //         minX: 0,
            //         maxX: 11,
            //         minY: 0,
            //         maxY: 6,
            //         titlesData: FlTitlesData(show: false),

            //         // showingTooltipIndicators: true,
            //         // titlesData: LineTitles.getTitleData(),
            //         gridData: FlGridData(
            //           show: false,
            //           // getDrawingHorizontalLine: (value) {
            //           //   return FlLine(
            //           //     color: transPrent,
            //           //     strokeWidth: 1,
            //           //   );
            //           // },
            //           drawVerticalLine: false,
            //           // getDrawingVerticalLine: (value) {
            //           //   return FlLine(
            //           //     color: transPrent,
            //           //     strokeWidth: 1,
            //           //   );
            //           // },
            //         ),
            //         borderData: FlBorderData(
            //           show: false,
            //           // border: Border.all(color: transPrent, width: 1),
            //         ),
            //         lineBarsData: [
            //           LineChartBarData(
            //             spots: [
            //               FlSpot(0, 3),
            //               FlSpot(2.6, 2),
            //               FlSpot(4.9, 5),
            //               FlSpot(6.8, 2.5),
            //               FlSpot(8, 4),
            //               FlSpot(9.5, 3),
            //               FlSpot(11, 4),
            //             ],
            //             isCurved: true,
            //             colors: gradientColorswhite,
            //             barWidth: 2,
            //             dotData: FlDotData(show: true),

            //             // belowBarData: BarAreaData(
            //             //     // show: true,
            //             //     // colors: gradientColors
            //             //     //     .map((color) => color.withOpacity(0.3))
            //             //     //     .toList(),
            //             //     ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        SizedBox(
          width: Get.width / 17,
        ),
      ],
    ),
  );
}

tabView1(WatchListState state, context1, id) {
  return SingleChildScrollView(
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Text("data"),
        GestureDetector(
          onTap: () {
            print("search");

            Get.to(BlocProvider(
                create: (context) => SearchListCubit(),
                child: SearchScreen(() {
                  BlocProvider.of<WatchListCubit>(context1).loadWatchList(id);
                }, id)));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            padding: EdgeInsets.symmetric(horizontal: 14),
            height: 40,
            // width: 700,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.search,
                  color: gray9B9797,
                  size: 20,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "search anything",
                  style: TextStyle(
                    fontSize: 14,
                    color: gray9B9797,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Container(
        //   padding: EdgeInsets.only(top: 0),
        //   decoration: BoxDecoration(
        //     color: null,
        //     // Box decoration takes a gradient
        //     // gradient: LinearGradient(
        //     //   // Where the linear gradient begins and ends
        //     //   begin: Alignment.topLeft,
        //     //   end: Alignment.bottomRight,
        //     //   // Add one stop for each color. Stops should increase from 0 to 1
        //     //   stops: [0.1, 0.3, 0.5, 0.8],
        //     //   colors: [
        //     //     // Colors are easy thanks to Flutter's Colors class.
        //     //     kPrimaryColorOrange,
        //     //     kPrimaryColororangePink,
        //     //     kPrimaryColororangetoPink,
        //     //     kPrimaryColorPink,
        //     //   ],
        //     // ),
        //   ),
        //   child: GestureDetector(
        //     onTap: () {
        //       Get.to(WatchListSearchScreen());
        //     },
        //     child: AppBar(
        //       backgroundColor: Colors.transparent,
        //       leadingWidth: 30,

        //       elevation: 0.0,
        //       centerTitle: true,
        //       title: Container(
        //           padding: EdgeInsets.symmetric(horizontal: 14),
        //           height: 40,
        //           // width: 700,
        //           decoration: BoxDecoration(
        //             color: white,
        //             borderRadius: BorderRadius.all(
        //               Radius.circular(30),
        //             ),
        //           ),
        //           child: Row(
        //             children: [
        //               Icon(
        //                 CupertinoIcons.search,
        //                 color: gray9B9797,
        //                 size: 20,
        //               ),
        //               SizedBox(
        //                 width: 8,
        //               ),
        //               Text(
        //                 "search anything",
        //                 style: TextStyle(
        //                   fontSize: 14,
        //                   color: gray9B9797,
        //                   fontFamily: "Nunito",
        //                   fontWeight: FontWeight.w400,
        //                 ),
        //               )
        //             ],
        //           )
        //           // child: TextField(
        //           //   // onChanged: (value) {
        //           //   //   // search(value);
        //           //   // },
        //           //   cursorColor: appColor,
        //           //   showCursor: false,
        //           //   // focusNode: _focusNode,
        //           //   // controller: _searchController, // Add this line
        //           //   keyboardType: TextInputType.none,
        //           //   decoration: InputDecoration(
        //           //     alignLabelWithHint: true,
        //           //     border: InputBorder.none,
        //           //     hintText: "Search anything",
        //           //     hintStyle: TextStyle(
        //           //       fontSize: 14,
        //           //       color: gray9B9797,
        //           //       fontFamily: "Nunito",
        //           //       fontWeight: FontWeight.w400,
        //           //     ),
        //           //     prefixIcon: Icon(
        //           //       CupertinoIcons.search,
        //           //       color: gray9B9797,
        //           //       size: 20,
        //           //     ),
        //           //     suffixIcon: Row(
        //           //       mainAxisSize: MainAxisSize.min,
        //           //       children: [
        //           //         Container(
        //           //           height: 20,
        //           //           width: 1,
        //           //           child: VerticalDivider(
        //           //             color: gray9B9797,
        //           //           ),
        //           //         ),
        //           //         IconButton(
        //           //           onPressed: () {
        //           //             // _focusNode.unfocus();
        //           //             Get.bottomSheet(
        //           //               Padding(
        //           //                 padding: const EdgeInsets.only(
        //           //                     top: 29, left: 30, right: 30),
        //           //                 child: SingleChildScrollView(
        //           //                   child: Column(
        //           //                     mainAxisSize: MainAxisSize.min,
        //           //                     children: [
        //           //                       Padding(
        //           //                         padding:
        //           //                             const EdgeInsets.only(bottom: 10),
        //           //                         child: Row(
        //           //                           mainAxisAlignment:
        //           //                               MainAxisAlignment.spaceBetween,
        //           //                           children: [
        //           //                             Text(
        //           //                               "Filter",
        //           //                               style: TextStyle(
        //           //                                 color: black0D1F3C,
        //           //                                 fontFamily: "PoppinsSemiBold",
        //           //                                 fontWeight: FontWeight.w600,
        //           //                                 fontSize: 24,
        //           //                               ),
        //           //                             ),
        //           //                             TextButton(
        //           //                               onPressed: () {
        //           //                                 //--------------------------------------
        //           //                                 print(theSelected);
        //           //                                 Get.back();
        //           //                               },
        //           //                               child: Text(
        //           //                                 "Done",
        //           //                                 style: TextStyle(
        //           //                                   color: black,
        //           //                                   fontFamily: "PoppinsMedium",
        //           //                                   fontWeight: FontWeight.w500,
        //           //                                   fontSize: 19,
        //           //                                 ),
        //           //                               ),
        //           //                             ),
        //           //                           ],
        //           //                         ),
        //           //                       ),
        //           //                       Row(
        //           //                         children: [
        //           //                           Obx(
        //           //                             () => MaterialButton(
        //           //                               onPressed: () {
        //           //                                 if (colorChangeController
        //           //                                         .buttonCheck1.isTrue ||
        //           //                                     colorChangeController
        //           //                                         .buttonCheck2.isTrue) {
        //           //                                   colorChangeController
        //           //                                       .buttonCheck1(false);
        //           //                                   colorChangeController
        //           //                                       .buttonCheck2(false);
        //           //                                 }
        //           //                                 colorChangeController
        //           //                                     .buttonCheck1(true);
        //           //                                 if (colorChangeController
        //           //                                     .buttonCheck1.isTrue) {
        //           //                                   //select all
        //           //                                   for (var i = 0;
        //           //                                       i <
        //           //                                           bottomSheetListBuild
        //           //                                               .length;
        //           //                                       i++) {
        //           //                                     theSelected.add(
        //           //                                         bottomSheetListBuild[i]
        //           //                                             ['title']);
        //           //                                   }
        //           //                                   colorChangeController
        //           //                                       .isCheck[0] = true;
        //           //                                   colorChangeController
        //           //                                       .isCheck[1] = true;
        //           //                                   colorChangeController
        //           //                                       .isCheck[2] = true;
        //           //                                   colorChangeController
        //           //                                       .isCheck[3] = true;
        //           //                                 }
        //           //                               },
        //           //                               elevation: 0,
        //           //                               height: 32,
        //           //                               minWidth: 88,
        //           //                               color:
        //           //                                   ////////////////////////////////////////////////
        //           //                                   colorChangeController
        //           //                                           .buttonCheck1.isTrue
        //           //                                       ? kPrimaryColororangetoPink
        //           //                                       : white,
        //           //                               shape: RoundedRectangleBorder(
        //           //                                 borderRadius:
        //           //                                     BorderRadius.circular(15),
        //           //                                 side: BorderSide(
        //           //                                   color: colorChangeController
        //           //                                           .buttonCheck1.isTrue
        //           //                                       ? transPrent
        //           //                                       : Color(0xffDFDFDF),
        //           //                                 ),
        //           //                               ),
        //           //                               child: Text(
        //           //                                 "Select All",
        //           //                                 style: TextStyle(
        //           //                                   fontSize: 15,
        //           //                                   color: colorChangeController
        //           //                                           .buttonCheck1.isTrue
        //           //                                       ? white
        //           //                                       : black,
        //           //                                   fontFamily: "PoppinsMedium",
        //           //                                   fontWeight: FontWeight.w500,
        //           //                                 ),
        //           //                               ),
        //           //                             ),
        //           //                           ),
        //           //                           SizedBox(
        //           //                             width: 12,
        //           //                           ),
        //           //                           Obx(
        //           //                             () => MaterialButton(
        //           //                               onPressed: () {
        //           //                                 if (colorChangeController
        //           //                                         .buttonCheck2.isTrue ||
        //           //                                     colorChangeController
        //           //                                         .buttonCheck1.isTrue) {
        //           //                                   colorChangeController
        //           //                                       .buttonCheck2(false);
        //           //                                   colorChangeController
        //           //                                       .buttonCheck1(false);
        //           //                                 }
        //           //                                 if (colorChangeController
        //           //                                     .buttonCheck2(true)) {
        //           //                                   theSelected.clear();
        //           //                                 }

        //           //                                 colorChangeController
        //           //                                     .buttonCheck2(true);
        //           //                                 if (colorChangeController
        //           //                                     .buttonCheck2.isTrue) {
        //           //                                   colorChangeController
        //           //                                       .isCheck[0] = false;
        //           //                                   colorChangeController
        //           //                                       .isCheck[1] = false;
        //           //                                   colorChangeController
        //           //                                       .isCheck[2] = false;
        //           //                                   colorChangeController
        //           //                                       .isCheck[3] = false;
        //           //                                 }
        //           //                               },
        //           //                               elevation: 0,
        //           //                               height: 32,
        //           //                               minWidth: 81,
        //           //                               color: colorChangeController
        //           //                                       .buttonCheck2.isTrue
        //           //                                   ? kPrimaryColororangetoPink
        //           //                                   : white,
        //           //                               shape: RoundedRectangleBorder(
        //           //                                 borderRadius:
        //           //                                     BorderRadius.circular(15),
        //           //                                 side: BorderSide(
        //           //                                   color: colorChangeController
        //           //                                           .buttonCheck2.isTrue
        //           //                                       ? transPrent
        //           //                                       : Color(0xffDFDFDF),
        //           //                                 ),
        //           //                               ),
        //           //                               child: Text(
        //           //                                 "Clear All",
        //           //                                 style: TextStyle(
        //           //                                   fontSize: 15,
        //           //                                   color: colorChangeController
        //           //                                           .buttonCheck2.isTrue
        //           //                                       ? white
        //           //                                       : black,
        //           //                                   fontFamily: "PoppinsMedium",
        //           //                                   fontWeight: FontWeight.w500,
        //           //                                 ),
        //           //                               ),
        //           //                             ),
        //           //                           ),
        //           //                         ],
        //           //                       ),
        //           //                       SizedBox(
        //           //                         height: 20,
        //           //                       ),
        //           //                       ListView.builder(
        //           //                         shrinkWrap: true,
        //           //                         physics: NeverScrollableScrollPhysics(),
        //           //                         itemCount: bottomSheetListBuild.length,
        //           //                         itemBuilder: (context, index) => Obx(
        //           //                           () => ListTile(
        //           //                             onTap: () {
        //           //                               colorChangeController
        //           //                                       .isCheck[index] =
        //           //                                   !colorChangeController
        //           //                                       .isCheck[index];

        //           //                               if (theSelected.contains(
        //           //                                   bottomSheetListBuild[index]
        //           //                                       ["title"])) {
        //           //                                 theSelected.remove(
        //           //                                     bottomSheetListBuild[index]
        //           //                                         ["title"]);
        //           //                               } else {
        //           //                                 theSelected.add(
        //           //                                     bottomSheetListBuild[index]
        //           //                                         ["title"]);
        //           //                               }
        //           //                             },
        //           //                             contentPadding: EdgeInsets.all(0),
        //           //                             // selected: ,
        //           //                             leading: Container(
        //           //                               width: 40,
        //           //                               height: 40,
        //           //                               decoration: BoxDecoration(
        //           //                                 // color: pageBackGroundC,
        //           //                                 // color: colorChangeController.isCheck[index] == true?kPrimaryColorOrange:pageBackGroundC,
        //           //                                 gradient: LinearGradient(
        //           //                                   // Where the linear gradient begins and ends
        //           //                                   begin: Alignment.bottomLeft,
        //           //                                   end: Alignment.topRight,

        //           //                                   // Add one stop for each color. Stops should increase from 0 to 1
        //           //                                   stops: [0.1, 0.3, 0.7, 0.8],
        //           //                                   colors: [
        //           //                                     // Colors are easy thanks to Flutter's Colors class.
        //           //                                     kPrimaryColorOrange,
        //           //                                     kPrimaryColororangePink,
        //           //                                     kPrimaryColororangetoPink,
        //           //                                     kPrimaryColorPink,
        //           //                                   ],
        //           //                                 ),
        //           //                                 borderRadius:
        //           //                                     BorderRadius.circular(12),
        //           //                               ),
        //           //                               child: Padding(
        //           //                                 padding:
        //           //                                     const EdgeInsets.all(10.0),
        //           //                                 child: SvgPicture.asset(
        //           //                                   bottomSheetListBuild[index]
        //           //                                       ["img"],
        //           //                                   color: white,
        //           //                                 ),
        //           //                               ),
        //           //                             ),
        //           //                             title: Text(
        //           //                               bottomSheetListBuild[index]
        //           //                                   ["title"],
        //           //                               style: TextStyle(
        //           //                                 color: black0D1F3C,
        //           //                                 // color: colorChangeController.isCheck[index] == true?kPrimaryColorOrange:pageBackGroundC,
        //           //                                 fontFamily: "PoppinsMedium",
        //           //                                 fontWeight: FontWeight.w500,
        //           //                                 fontSize: 19,
        //           //                               ),
        //           //                             ),

        //           //                             trailing: colorChangeController
        //           //                                         .isCheck[index] ==
        //           //                                     true
        //           //                                 ? Container(
        //           //                                     height: 25,
        //           //                                     width: 25,
        //           //                                     decoration: BoxDecoration(
        //           //                                       shape: BoxShape.circle,
        //           //                                       gradient: LinearGradient(
        //           //                                         // Where the linear gradient begins and ends
        //           //                                         begin: Alignment
        //           //                                             .bottomLeft,
        //           //                                         end: Alignment.topRight,

        //           //                                         // Add one stop for each color. Stops should increase from 0 to 1
        //           //                                         stops: [
        //           //                                           0.1,
        //           //                                           0.3,
        //           //                                           0.7,
        //           //                                           0.8
        //           //                                         ],
        //           //                                         colors: [
        //           //                                           // Colors are easy thanks to Flutter's Colors class.
        //           //                                           kPrimaryColorOrange,
        //           //                                           kPrimaryColororangePink,
        //           //                                           kPrimaryColororangetoPink,
        //           //                                           kPrimaryColorPink,
        //           //                                         ],
        //           //                                       ),
        //           //                                     ),
        //           //                                     child: Icon(
        //           //                                       Icons.check,
        //           //                                       color: white,
        //           //                                       size: 12,
        //           //                                     ),
        //           //                                   )
        //           //                                 : SizedBox.shrink(),
        //           //                           ),
        //           //                         ),
        //           //                       ),
        //           //                       SizedBox(
        //           //                         height: 30,
        //           //                       ),
        //           //                     ],
        //           //                   ),
        //           //                 ),
        //           //               ),
        //           //               ////Filter
        //           //               backgroundColor: white,
        //           //               shape: RoundedRectangleBorder(
        //           //                 borderRadius: BorderRadius.only(
        //           //                   topLeft: Radius.circular(20),
        //           //                   topRight: Radius.circular(20),
        //           //                 ),
        //           //               ),
        //           //               elevation: 2,
        //           //             );
        //           //           },
        //           //           icon: SvgPicture.asset(
        //           //             sort,
        //           //             color: gray9B9797,
        //           //           ),
        //           //         ),
        //           //       ],
        //           //     ),
        //           //   ),
        //           // ),
        //           ),
        //     ),
        //   ),
        // ),

        state is LoadedWatchWatchList
            ? ListView.builder(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.watchList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(state.watchList[index].marketWatchId),
                    onDismissed: (direction) {
                      // Implement your swipe to action logic here
                      // You can remove the item from the list or show an undo option
                    },
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        ToggleScreen(green219653);
                        // todo Display an alert for the delete action
                        // final bool res = await buyDialog("name","symbol",context);
                        BlocProvider<BuySellCubit>(create: (context) => BuySellCubit(),child: buyDialog(state.watchList[index].semInstrumentName,state.watchList[index].semTradingSymbol,context),);


                      // final bool res = await showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return buyDialog(context);
                        //     // return AlertDialog(
                        //     //   title: const Text("Confirm"),
                        //     //   content:
                        //     //       const Text("are you sure you want to buy?"),
                        //     //   actions: <Widget>[
                        //     //     TextButton(
                        //     //         onPressed: () {
                        //     //           //todo
                        //     //           Navigator.pop(context);
                        //     //           buyDialog(context);
                        //     //           // Navigator.push(context,
                        //     //           //     MaterialPageRoute(builder: (context) {
                        //     //           //   return BuyScreen();
                        //     //           // }));
                        //     //         },
                        //     //         child: const Text("YES")),
                        //     //     TextButton(
                        //     //       onPressed: () =>
                        //     //           Navigator.of(context).pop(false),
                        //     //       child: const Text("NO"),
                        //     //     ),
                        //     //   ],
                        //     // );
                        //   },
                        // );
                        // return res;
                      } else if (direction == DismissDirection.startToEnd) {
                        ToggleScreen(green219653);
                        // Display an alert for the archive action
                        final bool res = await sellDialog("widget.name", "widget.marketsymbol", context);
                        // final bool res = await showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return sellDialog(context);
                        //     // return AlertDialog(
                        //     //   title: const Text("Sell"),
                        //     //   content:
                        //     //       const Text("are you sure you want to sell?"),
                        //     //   actions: <Widget>[
                        //     //     TextButton(
                        //     //         onPressed: () {
                        //     //           Navigator.pop(context);
                        //     //           sellDialog(context);
                        //     //         },
                        //     //         child: const Text("YES")),
                        //     //     TextButton(
                        //     //       onPressed: () =>
                        //     //           Navigator.of(context).pop(false),
                        //     //       child: const Text("NO"),
                        //     //     ),
                        //     //   ],
                        //     // );
                        //   },
                        // );
                        // return res;
                      }
                    },
                    background: Container(
                      color: Colors.red,
                      // Customize the background color
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.green,
                      // Customize the background color
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.archive,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    //           // var item = snapshot.data[index];
                    /*child: listViewItemDesign(
                                      context: context,
                                      image: watchList[index].img,
                                      title: watchList[index].title,
                                      subTitle: watchList[index].subTitle,
                                      total: watchList[index].lastPrice.toString(),
                                      stock1: watchList[index].basePrice.toStringAsFixed(3),
                                      stock2: watchList[index].pChange,
                                      colorName: Colors.red,
                                    ),*/
                    child: listViewItemDesign(
                      context: context,
                      // image: watchListPageBuildDesign[index]["img"],
                      image: state.watchList[index].semTradingSymbol,

                      title:
                          state.watchList[index].semInstrumentName.toString(),
                      subTitle: state.watchList[index].semExmExchId,
                      total: state.watchList[index].semStrikePrice,
                      deletId: state.watchList[index].watchlistId.toString(),
                      // stock1: watchListPageBuildDesign[index]["stock1"],
                      // stock2: watchListPageBuildDesign[index]["stock2"],
                      colorName: Colors.red,
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ],
    ),
  );
}

listViewItemDesign(
    {String image,
    String title,
    String subTitle,
    String total,
    String stock1,
    String stock2,
    String deletId,
    BuildContext context,
    colorName}) {
  return InkWell(
    onTap: () {
      Get.to(BlocProvider(create: (context) => BuySellCubit(), child : BuySellScreen(title,image)));
    },
    child: Container(
      margin: EdgeInsets.only(
        left: Get.width / 34.28,
        right: Get.width / 34.28,
        bottom: Get.height / 99.04,
      ),
      padding: EdgeInsets.only(
        left: Get.width / 68.57,
        right: Get.width / 37.40,
        top: Get.height / 127.34,
        bottom: Get.height / 99.04,
      ),
      // height: 60,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.circular(12),
        /*borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12)
        ),*/
        boxShadow: [
          BoxShadow(
            color: Color(0xff26000000).withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 3,
            offset: Offset(0.5, 3),
          ),
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image(
                  image: AssetImage("assets/image/home/PARLE.png"),
                  // image: NetworkImage("image"),
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: black,
                        fontFamily: "NunitoSemiBold",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: gray4,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          /*Container(
            width: 84,
            height: 29,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
                titlesData: FlTitlesData(show: false),
                gridData: FlGridData(
                  show: false,
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 2.5),
                      FlSpot(8, 6),
                      FlSpot(9.5, 7),
                      FlSpot(11, 7),
                    ],
                    isCurved: true,
                    colors: gradientColors,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      colors: [
                        const Color(0xff73BE8C).withOpacity(0.4),
                        const Color(0xf73BE8C),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),*/
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                total,
                style: TextStyle(
                  fontSize: 16,
                  color: colorName,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      // text: stock1,
                      text: "20.20",
                      style: TextStyle(
                        fontSize: 15,
                        color: black,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "(",
                      style: TextStyle(
                        fontSize: 15,
                        color: black,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      // text: stock2,
                      text: "10.00",
                      style: TextStyle(
                        fontSize: 15,
                        color: colorName,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ")",
                      style: TextStyle(
                        fontSize: 15,
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
          SizedBox(
            width: 24,
          ),
          Material(
            type: MaterialType.transparency,
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: kPrimaryColororangetoPink),
                // color: kPrimaryColorOrange,
              ),
              child: InkWell(
                //borderRadius: BorderRadius.circular(100.0),
                onTap: () {
                  BlocProvider.of<WatchListCubit>(context)
                      .deletTowatchList(deletId);
                },
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.remove,
                    size: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

listViewItemDesignMostStock(
    {String image,
    String title,
    String subTitle,
    String total,
    String stock1,
    String stock2,
    BuildContext context,
    colorName}) {
  return InkWell(
    onTap: () {
      Get.to(BuySellScreen(title,image));
    },
    child: Container(
      margin: EdgeInsets.only(
        left: Get.width / 34.28,
        right: Get.width / 34.28,
        bottom: Get.height / 99.04,
      ),
      padding: EdgeInsets.only(
        left: Get.width / 68.57,
        right: Get.width / 37.40,
        top: Get.height / 127.34,
        bottom: Get.height / 99.04,
      ),
      // height: 60,
      width: Get.width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius: 0.1,
            blurRadius: 8,
            offset: Offset(0.5, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                // height: 50,
                // width: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 0.1,
                      blurRadius: 8,
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: SvgPicture.asset(image, width: 30, height: 30),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      color: black,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: 10,
                      color: black.withOpacity(0.3),
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: Get.width / 8.0,
            height: 29,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
                titlesData: FlTitlesData(show: false),
                gridData: FlGridData(
                  show: false,
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 2.5),
                      FlSpot(8, 6),
                      FlSpot(9.5, 7),
                      FlSpot(11, 7),
                    ],
                    isCurved: true,
                    colors: [colorName],
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: false,

                      //todo
                      // colors: [
                      //   const Color(0xff73BE8C).withOpacity(0.4),
                      //   const Color(0xf73BE8C),
                      // ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                total,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: stock1,
                      style: TextStyle(
                        fontSize: 15,
                        color: colorName,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "(",
                      style: TextStyle(
                        fontSize: 15,
                        color: colorName,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: stock2,
                      style: TextStyle(
                        fontSize: 15,
                        color: colorName,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ")",
                      style: TextStyle(
                        fontSize: 15,
                        color: colorName,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Material(
          //   type: MaterialType.transparency,
          //   child: Ink(
          //     decoration: BoxDecoration(
          //       border: Border.all(width: 1),
          //       // color: kPrimaryColorOrange,
          //     ),
          //     child: InkWell(
          //       //borderRadius: BorderRadius.circular(100.0),
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.all(2.0),
          //         child: Icon(
          //           Icons.add,
          //           size: 20.0,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    ),
  );
}

// design1Buy({color1}) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 17, right: 17, bottom: 17),
//     child: Container(
//       width: Get.width,
//       height: /*Get.height/ 15.91*/ 56,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "AXISBANK",
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: black2,
//                   fontFamily: "NunitoBold",
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               ToggleScreenBuy(color1),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 "₹2126.20",
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: color1,
//                   fontFamily: "NunitoBold",
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "+30.00",
//                       style: TextStyle(
//                         fontSize: 13,
//                         color: black,
//                         fontFamily: "Nunito",
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "(",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: black,
//                         fontFamily: "Nunito",
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "+0.72%",
//                       style: TextStyle(
//                         fontSize: 13,
//                         color: color1,
//                         fontFamily: "Nunito",
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ")",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: black,
//                         fontFamily: "Nunito",
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// design1Sell({color1}) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 17, right: 17, bottom: 17),
//     child: Container(
//       width: Get.width,
//       height: /*Get.height/ 15.91*/ 56,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "AXISBANK",
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: black2,
//                   fontFamily: "NunitoBold",
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               ToggleScreenSell(color1),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 "₹2126.20",
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: color1,
//                   fontFamily: "NunitoBold",
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "+30.00",
//                       style: TextStyle(
//                         fontSize: 13,
//                         color: black,
//                         fontFamily: "Nunito",
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "(",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: black,
//                         fontFamily: "Nunito",
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "+0.72%",
//                       style: TextStyle(
//                         fontSize: 13,
//                         color: color1,
//                         fontFamily: "Nunito",
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ")",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: black,
//                         fontFamily: "Nunito",
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// design2({color2}) {
//   return Padding(
//     padding: EdgeInsets.only(
//         left: Get.width / 24.20 /* 17*/,
//         right: Get.width / 24.20 /*17*/,
//         top: 17),
//     child: Container(
//       height: 60,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Quantity",
//                 style: TextStyle(
//                   fontSize: 13,
//                   color: gray4,
//                   fontFamily: "NunitoSemiBold",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Container(
//                 height: 31,
//                 width: Get.width / 4.37 /*94*/,
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                   color: white,
//                   borderRadius: BorderRadius.circular(100),
//                   border: Border.all(
//                     color: Color(0xff66000000),
//                     width: 1,
//                   ),
//                 ),
//                 child: TextField(
//                   textAlign: TextAlign.start,
//                   cursorColor: black,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Prise",
//                 style: TextStyle(
//                   fontSize: 13,
//                   color: gray4,
//                   fontFamily: "NunitoSemiBold",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Container(
//                 height: 31,
//                 width: Get.width / 4.37 /* 94*/,
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                   color: white,
//                   borderRadius: BorderRadius.circular(100),
//                   border: Border.all(
//                     color: Color(0xff66000000),
//                     width: 1,
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "₹2126.20",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: black,
//                       fontFamily: "NunitoBold",
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Order",
//                 style: TextStyle(
//                   fontSize: 13,
//                   color: gray4,
//                   fontFamily: "NunitoSemiBold",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Container(
//                 height: 31,
//                 width: Get.width / 4.37 /*94*/,
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                   color: color2,
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 child: Center(
//                   child: DropdownButtonHideUnderline(
//                     child: Obx(
//                       () => DropdownButton<String>(
//                         // menuMaxHeight: 40,
//                         // itemHeight: 20,
//                         isDense: true,
//                         value: myTabController.selectedValue.value,
//                         focusColor: appColor,
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.red,
//                           fontFamily: "NunitoBold",
//                           fontWeight: FontWeight.w700,
//                         ),
//                         autofocus: true,
//                         elevation: 0,
//                         icon: Icon(
//                           Icons.keyboard_arrow_down_outlined,
//                           color: white,
//                         ),
//                         // isDense: true,
//                         items: myTabController.dropList.map((e) {
//                           return DropdownMenuItem(
//                             child: Text(
//                               e,
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: black,
//                                 fontFamily: "NunitoBold",
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             value: e,
//                           );
//                         }).toList(),
//                         onChanged: (val) {
//                           myTabController.setSelected(val);
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// design3({color2}) {
//   return Padding(
//     padding: EdgeInsets.only(
//         left: Get.width / 24.20 /*17*/,
//         right: Get.width / 24.20 /*17*/,
//         top: 17,
//         bottom: 20),
//     child: Container(
//       height: 60,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Mode",
//                 style: TextStyle(
//                   fontSize: 13,
//                   color: gray4,
//                   fontFamily: "NunitoSemiBold",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Container(
//                 height: 31,
//                 width: Get.width / 4.37 /*94*/,
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                   color: pageBackGroundC,
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Intraday",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: appColor,
//                       fontFamily: "NunitoSemiBold",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 /* child: TextField(
//                   textAlign: TextAlign.start,
//                   cursorColor: black,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                   ),
//                 ),*/
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             // crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 31,
//                 width: Get.width / 4.37 /*94*/,
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                   color: white,
//                   borderRadius: BorderRadius.circular(100),
//                   border: Border.all(
//                     color: Color(0xff66000000),
//                     width: 1,
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Delivery",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: gray4,
//                       fontFamily: "NunitoSemiBold",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Validity",
//                 style: TextStyle(
//                   fontSize: 13,
//                   color: gray4,
//                   fontFamily: "NunitoSemiBold",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Container(
//                 height: 31,
//                 width: Get.width / 4.37 /*94*/,
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                   color: color2,
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 child: Center(
//                   child: DropdownButtonHideUnderline(
//                     child: Obx(
//                       () => DropdownButton<String>(
//                         // menuMaxHeight: 40,
//                         // itemHeight: 20,
//                         isDense: true,
//                         value: myTabController.selectedValue1.value,
//                         focusColor: appColor,
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.red,
//                           fontFamily: "NunitoBold",
//                           fontWeight: FontWeight.w700,
//                         ),
//                         autofocus: true,
//                         elevation: 0,
//                         icon: Icon(
//                           Icons.keyboard_arrow_down_outlined,
//                           color: white,
//                         ),
//                         // isDense: true,
//                         items: myTabController.dropList1.map((e) {
//                           return DropdownMenuItem(
//                             child: Text(
//                               e,
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: black,
//                                 fontFamily: "NunitoBold",
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             value: e,
//                           );
//                         }).toList(),
//                         onChanged: (val) {
//                           myTabController.setSelected1(val);
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// design3Sell({color2}) {
//   return Padding(
//     padding: EdgeInsets.only(
//         left: Get.width / 24.20 /*17*/,
//         right: Get.width / 24.20 /*17*/,
//         top: 17,
//         bottom: 20),
//     child: Container(
//       height: 60,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Mode",
//                 style: TextStyle(
//                   fontSize: 13,
//                   color: gray4,
//                   fontFamily: "NunitoSemiBold",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Container(
//                 height: 31,
//                 width: Get.width / 4.37 /*94*/,
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                   color: white,
//                   borderRadius: BorderRadius.circular(100),
//                   border: Border.all(
//                     color: Color(0xff66000000),
//                     width: 1,
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Intraday",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: gray4,
//                       fontFamily: "NunitoSemiBold",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             // crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 31,
//                 width: Get.width / 4.37 /*94*/,
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                   color: white,
//                   borderRadius: BorderRadius.circular(100),
//                   border: Border.all(
//                     color: Color(0xff66000000),
//                     width: 1,
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Delivery",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: gray4,
//                       fontFamily: "NunitoSemiBold",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Validity",
//                 style: TextStyle(
//                   fontSize: 13,
//                   color: gray4,
//                   fontFamily: "NunitoSemiBold",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Container(
//                 height: 31,
//                 width: Get.width / 4.37 /*94*/,
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                   color: color2,
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 child: Center(
//                   child: DropdownButtonHideUnderline(
//                     child: Obx(
//                       () => DropdownButton<String>(
//                         // menuMaxHeight: 40,
//                         // itemHeight: 20,
//                         isDense: true,
//                         value: myTabController.selectedValue1.value,
//                         focusColor: appColor,
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.red,
//                           fontFamily: "NunitoBold",
//                           fontWeight: FontWeight.w700,
//                         ),
//                         autofocus: true,
//                         elevation: 0,
//                         icon: Icon(
//                           Icons.keyboard_arrow_down_outlined,
//                           color: white,
//                         ),
//                         // isDense: true,
//                         items: myTabController.dropList1.map((e) {
//                           return DropdownMenuItem(
//                             child: Text(
//                               e,
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: black,
//                                 fontFamily: "NunitoBold",
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             value: e,
//                           );
//                         }).toList(),
//                         onChanged: (val) {
//                           myTabController.setSelected1(val);
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// buyDialog(context) {
//   ProfileController profileController = Get.find();
//   Dialog fancyDialog = Dialog(
//     insetPadding: EdgeInsets.zero,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(
//         32.0,
//       ),
//     ),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(0.0),
//           child: Align(
//             alignment: Alignment.topRight,
//             child: IconButton(
//               onPressed: () {
//                 Get.back();
//               },
//               icon: Icon(CupertinoIcons.clear),
//             ),
//           ),
//         ),
//         design1Buy(color1: appColor2F80ED),
//         Divider(
//           thickness: 3,
//           color: grayF2F2F2,
//         ),
//         design2(color2: appColor),
//         design3(color2: appColor),
//         Divider(
//           thickness: 3,
//           color: grayF2F2F2,
//         ),
//         Padding(
//           padding:
//               const EdgeInsets.only(right: 17, left: 17, top: 10, bottom: 10),
//           child: Row(
//             children: [
//               Text(
//                 "Set Stoploss",
//                 style: TextStyle(
//                   color: black2,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: "NunitoBold",
//                   fontSize: 18,
//                 ),
//               ),
//               SizedBox(
//                 width: 14,
//               ),
//               Obx(
//                 () => CupertinoSwitch(
//                   activeColor: appColor,
//                   value: colorChangeController.lights.value,
//                   onChanged: (bool value) {
//                     colorChangeController.lights.value = value;
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Divider(
//           thickness: 3,
//           color: grayF2F2F2,
//         ),
//         Padding(
//           padding:
//               const EdgeInsets.only(right: 17, left: 17, top: 10, bottom: 10),
//           child: Row(
//             children: [
//               Text(
//                 "Set target",
//                 style: TextStyle(
//                   color: black2,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: "NunitoBold",
//                   fontSize: 18,
//                 ),
//               ),
//               SizedBox(
//                 width: 36,
//               ),
//               Obx(
//                 () => CupertinoSwitch(
//                   activeColor: appColor,
//                   value: colorChangeController.lights1.value,
//                   onChanged: (bool value) {
//                     colorChangeController.lights1.value = value;
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Divider(
//           thickness: 3,
//           color: grayF2F2F2,
//         ),
//         Padding(
//           padding: EdgeInsets.only(top: 39, bottom: 16),
//           child: buyDropDownButton(
//             textLabel: "BUY",
//             onTapButton: () {
//               profileController.selectedIndex.value = 1;
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DrawerOpenScreen(),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//   );
//   return showDialog(
//       context: context, builder: (BuildContext context) => fancyDialog);
// }

// sellDialog(context) {
//   Dialog fancyDialog = Dialog(
//     insetPadding: EdgeInsets.zero,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(
//         32.0,
//       ),
//     ),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(0.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 icon: Icon(CupertinoIcons.clear),
//               ),
//             ],
//           ),
//         ),
//         design1Sell(color1: redEB5757),
//         Divider(
//           thickness: 3,
//           color: grayF2F2F2,
//         ),
//         design2(color2: redEB5757),
//         design3Sell(color2: redEB5757),
//         Divider(
//           thickness: 3,
//           color: grayF2F2F2,
//         ),
//         Padding(
//           padding:
//               const EdgeInsets.only(right: 17, left: 17, top: 10, bottom: 10),
//           child: Row(
//             children: [
//               Text(
//                 "Set Stoploss",
//                 style: TextStyle(
//                   color: black2,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: "NunitoBold",
//                   fontSize: 18,
//                 ),
//               ),
//               SizedBox(
//                 width: 14,
//               ),
//               Obx(
//                 () => CupertinoSwitch(
//                   activeColor: redEB5757,
//                   value: colorChangeController.lights.value,
//                   onChanged: (bool value) {
//                     colorChangeController.lights.value = value;
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Divider(
//           thickness: 3,
//           color: grayF2F2F2,
//         ),
//         Padding(
//           padding:
//               const EdgeInsets.only(right: 17, left: 17, top: 10, bottom: 10),
//           child: Row(
//             children: [
//               Text(
//                 "Set target",
//                 style: TextStyle(
//                   color: black2,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: "NunitoBold",
//                   fontSize: 18,
//                 ),
//               ),
//               SizedBox(
//                 width: 36,
//               ),
//               Obx(
//                 () => CupertinoSwitch(
//                   activeColor: redEB5757,
//                   value: colorChangeController.lights1.value,
//                   onChanged: (bool value) {
//                     colorChangeController.lights1.value = value;
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Divider(
//           thickness: 3,
//           color: grayF2F2F2,
//         ),
//         Padding(
//           padding: EdgeInsets.only(top: 39, bottom: 16),
//           child: sellDropDownButton(
//             onTapButton: () {},
//             textLabel: "SELL",
//           ),
//         ),
//       ],
//     ),
//   );
//   return showDialog(
//       context: context, builder: (BuildContext context) => fancyDialog);
// }
