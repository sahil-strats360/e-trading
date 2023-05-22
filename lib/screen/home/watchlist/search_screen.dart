import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/bloc/_search/search_cubit.dart';
import 'package:mymoney/bloc/_search/search_state.dart';
import 'package:mymoney/model/marketwatch_model.dart';
import '../../../bloc/_watchlist/watchlist_cubit.dart';
import '../../../bloc/_watchlist/watchlist_state.dart' as WatchListState;
import '../../../controller/conteiner_color_change_keypade.dart';
import '../../../controller/drawer_open_controller.dart';
import '../../../utils/app_bar.dart';
import '../../../utils/color.dart';
import '../../../utils/data.dart';
import '../../../utils/imagenames.dart';
import '../drawer_screen_dir/mutualFunds/buy_sell_screen.dart';

String search;

class SearchScreen extends StatefulWidget {
  Function reload;
  int marketwatchId;

  SearchScreen(this.reload, this.marketwatchId);

  @override
  State<SearchScreen> createState() => _WatchListSearchScreenState();
}

class _WatchListSearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // model = ((BlocProvider.of<WatchListCubit>(context).state
    //         as WatchListState.Loaded).marketList);
    return Scaffold(
        body: BlocConsumer<SearchListCubit, SearchListState>(
      listener: (context, state) {
        // todo
        if (state is Added) {
          if (state.message == "Script added successfully!") {
            print("done");

            //  await BlocProvider.of<WatchListCubit>(context).loadWatchList();
            Navigator.pop(context);
            widget.reload();
          }
        }
      },
      builder: (context, state) {
        if (state is Init) {
          BlocProvider.of<SearchListCubit>(context).loadsearchList(search);
        }
        // search(String search) {
        //   if (search == null) {
        //     searchList = currentListPageBuildDesign;
        //   } else {
        //     searchList = currentListPageBuildDesign
        //         .where((element) => element['bankName']
        //             .toLowerCase()
        //             .contains(search.toLowerCase()))
        //         .toList();
        //   }
        // }
        return Column(
          children: [
            watchListSearchScreen(onchange: (value) {
              setState(() {
                search = value;
                Timer(const Duration(seconds: 3), () {
                  BlocProvider.of<SearchListCubit>(context)
                      .loadsearchList(search);
                });
              });
            }),
            state is Loaded
                ? Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          // if (state is Loaded) {
                          // if (index == state.searchList.length) {
                          //   Center(
                          //     child: CircularProgressIndicator(),
                          //   );
                          // }
                          return searchlistItemDesign(
                            context: context,
                            image: watchListPageBuildDesign[index]["img"],
                            title: state.searchList[index].semInstrumentName,
                            subTitle: state.searchList[index].semExmExchId,
                            total: state.searchList[index].semStrikePrice,
                            stock1: watchListPageBuildDesign[index]["stock1"],
                            stock2: watchListPageBuildDesign[index]["stock2"],
                            watchListid: widget.marketwatchId,
                            script_id: state.searchList[index].id.toString(),
                            colorName: Colors.red,
                          );
                          // }
                          // return Center(child: CircularProgressIndicator(),);
                        },
                        itemCount: state is Loaded
                            ? state.searchList.length
                            : watchListPageBuildDesign.length),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        );
      },
    ));
  }
}

// String search;
// listViewItemDesign(
//     {String image,
//     String title,
//     String subTitle,
//     String total,
//     String stock1,
//     String stock2,
//     BuildContext context,
//     colorName}) {
//   return Container(
//     margin: EdgeInsets.only(
//       left: Get.width / 34.28,
//       right: Get.width / 34.28,
//       bottom: Get.height / 99.04,
//     ),
//     padding: EdgeInsets.only(
//       left: Get.width / 68.57,
//       right: Get.width / 37.40,
//       top: Get.height / 127.34,
//       bottom: Get.height / 99.04,
//     ),
//     // height: 60,
//     width: Get.width,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       //borderRadius: BorderRadius.circular(12),
//       /*borderRadius: BorderRadius.only(
//         bottomLeft: Radius.circular(12),
//         bottomRight: Radius.circular(12)
//       ),*/
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
//         Container(
//           child: Row(
//             children: [
//               Image(
//                 image: AssetImage(image),
//                 width: 30,
//                 height: 30,
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: black,
//                       fontFamily: "NunitoSemiBold",
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                   Text(
//                     subTitle,
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: gray4,
//                       fontFamily: "Nunito",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         /*Container(
//           width: 84,
//           height: 29,
//           child: LineChart(
//             LineChartData(
//               minX: 0,
//               maxX: 11,
//               minY: 0,
//               maxY: 6,
//               titlesData: FlTitlesData(show: false),
//               gridData: FlGridData(
//                 show: false,
//                 drawVerticalLine: false,
//               ),
//               borderData: FlBorderData(
//                 show: false,
//               ),
//               lineBarsData: [
//                 LineChartBarData(
//                   spots: [
//                     FlSpot(0, 3),
//                     FlSpot(2.6, 2),
//                     FlSpot(4.9, 5),
//                     FlSpot(6.8, 2.5),
//                     FlSpot(8, 6),
//                     FlSpot(9.5, 7),
//                     FlSpot(11, 7),
//                   ],
//                   isCurved: true,
//                   colors: gradientColors,
//                   barWidth: 2,
//                   dotData: FlDotData(show: false),
//                   belowBarData: BarAreaData(
//                     show: true,
//                     colors: [
//                       const Color(0xff73BE8C).withOpacity(0.4),
//                       const Color(0xf73BE8C),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),*/
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               total,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: colorName,
//                 fontFamily: "Nunito",
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: stock1,
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: black,
//                       fontFamily: "Nunito",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextSpan(
//                     text: "(",
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: black,
//                       fontFamily: "Nunito",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextSpan(
//                     text: stock2,
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: colorName,
//                       fontFamily: "Nunito",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextSpan(
//                     text: ")",
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: black,
//                       fontFamily: "Nunito",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

watchListSearchScreen({Function onchange}) {
  ColorChangeController colorChangeController = Get.find();
  DrawerOpen drawerOpen = Get.put(DrawerOpen());
  FocusNode _focusNode = new FocusNode();
  // TextEditingController _searchController = TextEditingController(); // Add this line

  // void _onSearchTextChanged(String searchText) {
  //   /*setState(() {
  //     _searchResults = _listItems.where((item) => item.contains(searchText)).toList();
  //   });*/
  // }
  return AppBar(
    backgroundColor: Colors.transparent,
    leadingWidth: 30,
    elevation: 0.0,
    centerTitle: true,
    // flexibleSpace: Container(
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //       stops: [0.1, 0.3, 0.7, 0.8],
    //       colors: [
    //         kPrimaryColorOrange,
    //         kPrimaryColororangePink,
    //         kPrimaryColororangetoPink,
    //         kPrimaryColorPink,
    //       ],
    //       begin: Alignment.topLeft,
    //       end: Alignment.bottomRight,
    //     ),
    //   ),
    // ),

    ///Drawer
    /*leading: IconButton(
      padding: EdgeInsets.only(left: 10),
      icon: SvgPicture.asset(
        drawerIcon,
        color: black,
      ),
      onPressed: () {
        drawerOpen.xOffset.value = -150;
        drawerOpen.yOffset.value = 120;
        drawerOpen.isChange(true);
        drawerOpen.scaleFactor.value = 0.7;
      },
    ),*/
    title: Container(
      height: 40,
      // width: 700,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: TextField(
        onChanged: onchange,
        cursorColor: appColor,
        focusNode: _focusNode,
        // controller: _searchController, // Add this line

        decoration: InputDecoration(
          alignLabelWithHint: true,
          border: InputBorder.none,
          hintText: "Search anything",
          hintStyle: TextStyle(
            fontSize: 14,
            color: gray9B9797,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: gray9B9797,
            size: 20,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 20,
                width: 1,
                child: VerticalDivider(
                  color: gray9B9797,
                ),
              ),
              IconButton(
                onPressed: () {
                  _focusNode.unfocus();
                  Get.bottomSheet(
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 29, left: 30, right: 30),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Filter",
                                    style: TextStyle(
                                      color: black0D1F3C,
                                      fontFamily: "PoppinsSemiBold",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //--------------------------------------
                                      print(theSelected);
                                      Get.back();
                                    },
                                    child: Text(
                                      "Done",
                                      style: TextStyle(
                                        color: black,
                                        fontFamily: "PoppinsMedium",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Obx(
                                  () => MaterialButton(
                                    onPressed: () {
                                      if (colorChangeController
                                              .buttonCheck1.isTrue ||
                                          colorChangeController
                                              .buttonCheck2.isTrue) {
                                        colorChangeController
                                            .buttonCheck1(false);
                                        colorChangeController
                                            .buttonCheck2(false);
                                      }
                                      colorChangeController.buttonCheck1(true);
                                      if (colorChangeController
                                          .buttonCheck1.isTrue) {
                                        //select all
                                        for (var i = 0;
                                            i < bottomSheetListBuild.length;
                                            i++) {
                                          theSelected.add(
                                              bottomSheetListBuild[i]['title']);
                                        }
                                        colorChangeController.isCheck[0] = true;
                                        colorChangeController.isCheck[1] = true;
                                        colorChangeController.isCheck[2] = true;
                                        colorChangeController.isCheck[3] = true;
                                      }
                                    },
                                    elevation: 0,
                                    height: 32,
                                    minWidth: 88,
                                    color:
                                        ////////////////////////////////////////////////
                                        colorChangeController
                                                .buttonCheck1.isTrue
                                            ? kPrimaryColororangetoPink
                                            : white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                        color: colorChangeController
                                                .buttonCheck1.isTrue
                                            ? transPrent
                                            : Color(0xffDFDFDF),
                                      ),
                                    ),
                                    child: Text(
                                      "Select All",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: colorChangeController
                                                .buttonCheck1.isTrue
                                            ? white
                                            : black,
                                        fontFamily: "PoppinsMedium",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Obx(
                                  () => MaterialButton(
                                    onPressed: () {
                                      if (colorChangeController
                                              .buttonCheck2.isTrue ||
                                          colorChangeController
                                              .buttonCheck1.isTrue) {
                                        colorChangeController
                                            .buttonCheck2(false);
                                        colorChangeController
                                            .buttonCheck1(false);
                                      }
                                      if (colorChangeController
                                          .buttonCheck2(true)) {
                                        theSelected.clear();
                                      }

                                      colorChangeController.buttonCheck2(true);
                                      if (colorChangeController
                                          .buttonCheck2.isTrue) {
                                        colorChangeController.isCheck[0] =
                                            false;
                                        colorChangeController.isCheck[1] =
                                            false;
                                        colorChangeController.isCheck[2] =
                                            false;
                                        colorChangeController.isCheck[3] =
                                            false;
                                      }
                                    },
                                    elevation: 0,
                                    height: 32,
                                    minWidth: 81,
                                    color: colorChangeController
                                            .buttonCheck2.isTrue
                                        ? kPrimaryColororangetoPink
                                        : white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                        color: colorChangeController
                                                .buttonCheck2.isTrue
                                            ? transPrent
                                            : Color(0xffDFDFDF),
                                      ),
                                    ),
                                    child: Text(
                                      "Clear All",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: colorChangeController
                                                .buttonCheck2.isTrue
                                            ? white
                                            : black,
                                        fontFamily: "PoppinsMedium",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: bottomSheetListBuild.length,
                              itemBuilder: (context, index) => Obx(
                                () => ListTile(
                                  onTap: () {
                                    colorChangeController.isCheck[index] =
                                        !colorChangeController.isCheck[index];

                                    if (theSelected.contains(
                                        bottomSheetListBuild[index]["title"])) {
                                      theSelected.remove(
                                          bottomSheetListBuild[index]["title"]);
                                    } else {
                                      theSelected.add(
                                          bottomSheetListBuild[index]["title"]);
                                    }
                                  },
                                  contentPadding: EdgeInsets.all(0),
                                  // selected: ,
                                  leading: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      // color: pageBackGroundC,
                                      // color: colorChangeController.isCheck[index] == true?kPrimaryColorOrange:pageBackGroundC,
                                      gradient: LinearGradient(
                                        // Where the linear gradient begins and ends
                                        begin: Alignment.bottomLeft,
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
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SvgPicture.asset(
                                        bottomSheetListBuild[index]["img"],
                                        color: white,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    bottomSheetListBuild[index]["title"],
                                    style: TextStyle(
                                      color: black0D1F3C,
                                      // color: colorChangeController.isCheck[index] == true?kPrimaryColorOrange:pageBackGroundC,
                                      fontFamily: "PoppinsMedium",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19,
                                    ),
                                  ),

                                  trailing:
                                      colorChangeController.isCheck[index] ==
                                              true
                                          ? Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(
                                                  // Where the linear gradient begins and ends
                                                  begin: Alignment.bottomLeft,
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
                                              child: Icon(
                                                Icons.check,
                                                color: white,
                                                size: 12,
                                              ),
                                            )
                                          : SizedBox.shrink(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ////Filter
                    backgroundColor: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    elevation: 2,
                  );
                },
                icon: SvgPicture.asset(
                  sort,
                  color: gray9B9797,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

searchlistItemDesign(
    {String image,
    String title,
    String subTitle,
    String total,
    String stock1,
    String stock2,
    BuildContext context,
    int watchListid,
    String script_id,
    colorName}) {
  return InkWell(
    onTap: () {
      Get.to(BuySellScreen());
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
                  image: AssetImage(image),
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
                      text: stock1,
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
                border: Border.all(width: 1,color: kPrimaryColororangetoPink),
                // color: kPrimaryColorOrange,
              ),
              child: InkWell(
                //borderRadius: BorderRadius.circular(100.0),
                onTap: () {
                  BlocProvider.of<SearchListCubit>(context)
                      .addTowatchList(script_id, watchListid);
                },
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.add,
                    size: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
          // IconButton(
          //   // style:  ButtonStyle(
          //   //     // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          //   //     foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
          //   //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //   //         RoundedRectangleBorder(
          //   //             borderRadius: BorderRadius.circular(18.0),
          //   //             side: BorderSide(color: Colors.red)
          //   //         )
          //   //     )
          //   // ),
          //   onPressed: () {
          //     //todo
          //     BlocProvider.of<SearchListCubit>(context)
          //         .addTowatchList(script_id, watchListid);
          //   },
          //   icon: Icon(Icons.add, size: 20.0),
          //   color: Colors.black,
          // )
          // Checkbox(
          //   value: false,
          //   onChanged: (value) {
          //     BlocProvider.of<WatchListCubit>(context).loadWatchList(id);
          //   },
          // )
        ],
      ),
    ),
  );
}
