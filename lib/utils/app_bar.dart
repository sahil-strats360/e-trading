

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/conteiner_color_change_keypade.dart';
import '../controller/drawer_open_controller.dart';
import 'color.dart';
import 'data.dart';
import 'imagenames.dart';

// class Appbar extends StatefulWidget {
//   const Appbar({Key key}) : super(key: key);

//   @override
//   State<Appbar> createState() => _AppbarState();
// }

// class _AppbarState extends State<Appbar> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
var theSelected = [];
appBarDesign(Function search) {
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
        onChanged: (value) {
          search(value);
        },
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
