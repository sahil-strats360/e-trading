import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/data.dart';

import '../../../../utils/imagenames.dart';

class BookedPLScreen extends StatefulWidget {
  List _foundList = [];

  BookedPLScreen(String search) {
    if (search == null) {
      _foundList = bookedListPageBuildDesign;
    } else {
      _foundList = bookedListPageBuildDesign
          .where((element) =>
              element['bankName'].toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
  }

  @override
  State<BookedPLScreen> createState() => _BookedPLScreenState();
}

class _BookedPLScreenState extends State<BookedPLScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget._foundList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: index == widget._foundList.length - 1 ? 120 : 0),
              child: bookedListDesign(
                ltp: widget._foundList[index]["ltp"],
                image: widget._foundList[index]["img"],
                bankName: widget._foundList[index]["bankName"],
                avgText: widget._foundList[index]["avgText"],
                profileColor: widget._foundList[index]["profileColor"],
                profileText1: widget._foundList[index]["profileText1"],
                profileText2: widget._foundList[index]["profileText2"],
                qty: widget._foundList[index]["qty"],
              ),
            );
          },
        ),
        bookedListPageBuildDesign.isNotEmpty
            ? Positioned(
                bottom: 10,
                right: 12,
                left: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  margin: EdgeInsets.only(right: 12, left: 12, bottom: 28),
                  // width: Get.width,
                  width: Get.width,
                  // height: 50,
                  height: Get.height / 8.14,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff40000000).withOpacity(0.1),
                          offset: Offset(0.5, 3),
                          blurRadius: 8,
                          spreadRadius: 0.1,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Invested",
                            style: TextStyle(color: gray, fontSize: 16),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "32000.00",
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 34),
                        height: 40,
                        width: 1,
                        child: VerticalDivider(
                          color: gray9B9797,
                        ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Current",
                            style: TextStyle(color: gray, fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "+32000.00",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                      Spacer(),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 34),
                        height: 40,
                        width: 1,
                        child: VerticalDivider(
                          color: gray9B9797,
                        ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Today P/L",
                            style: TextStyle(color: gray, fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "+217.00",
                            style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ],
                  ),
                ))
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset(benner1oderscreen,
                      height: Get.height / 4.22,
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    Text(
                      "You Have Not Placed Any Orders!",
                      style: TextStyle(
                        fontSize: 15,
                        color: black,
                        fontFamily: "NunitoSemiBold",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Go to Watchlist",
                      style: TextStyle(
                        fontSize: 15,
                        color: appColor,
                        fontFamily: "NunitoBold",
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
      ],
    );
  }
}

bookedListDesign({
  String qty,
  String image,
  String bankName,
  String avgText,
  String profileText1,
  String profileText2,
  Color profileColor,
  String ltp,
}) {
  return Container(
    margin: EdgeInsets.only(
      left: 12,
      right: 12,
      bottom: 9,
      top: 9,
    ),
    padding: EdgeInsets.only(
      left: 11,
      right: 6,
      bottom: 12,
      top: 9,
    ),
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
    child: Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              // height: 18,
              // width: 30,
              decoration: BoxDecoration(
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
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  qty,
                  style: TextStyle(
                    fontSize: 8,
                    color: white,
                    fontFamily: "NunitoSemiBold",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 6,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Qty",
                    style: TextStyle(
                      fontSize: 10,
                      color: black.withOpacity(0.3),
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              "Invested",
              style: TextStyle(
                fontSize: 10,
                color: black.withOpacity(0.3),
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Container(
              height: 18,
              width: 52,
              decoration: BoxDecoration(
                color: green219653,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  avgText,
                  style: TextStyle(
                    fontSize: 8,
                    color: white,
                    fontFamily: "NunitoSemiBold",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        //-----------------------------------------------------------
        Divider(),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 0.1,
                    blurRadius: 8,
                  ),
                ],
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.fitWidth,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //-------------------------------bankname-----------
                  bankName,
                  style: TextStyle(
                    fontSize: 12,
                    color: black,
                    // fontFamily: "NunitoSemiBold",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "NSE REG LIMIT",
                  style: TextStyle(
                    fontSize: 10,
                    color: black.withOpacity(0.3),
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Profit",
                  style: TextStyle(
                    fontSize: 12,
                     color: black.withOpacity(0.4),
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: profileText1,
                    style: TextStyle(
                      fontSize: 14,
                      color: profileColor,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "(",
                    style: TextStyle(
                      fontSize: 14,
                      color: black,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: profileText2,
                    style: TextStyle(
                      fontSize: 14,
                      color: profileColor,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ")",
                    style: TextStyle(
                      fontSize: 14,
                      color: black,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]))
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  "LTP",
                  style: TextStyle(
                    fontSize: 12,
                     color: black.withOpacity(0.4),
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ltp,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.deepOrange,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}
