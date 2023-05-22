import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/Gold/gold_screen.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/IPO/ipo_screen.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/MarginCalculator/margin_calculator_screen.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/PriceAlert/creat_price_alert_screen.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/Research/reserach_screen.dart';
import 'package:mymoney/screen/home/drawer_screen_dir/mutualFunds/mutual_funds_screen.dart';
import 'package:mymoney/screen/welcome/welcome_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

const List notificationList = [
  {
    "img": stockUp,
    "title": "Axis Buy 2021.00 order is pending.",
    "time": "9.24 Am"
  },
  {
    "img": stockDown,
    "title": "Axis Sell 2125.50 order is pending.",
    "time": "10.00 pm"
  },
  {
    "img": stockUp,
    "title": "Eric Holfman2 hrs ago2 hrs ago",
    "time": "12.20 Am"
  },
  {
    "img": stockUp,
    "title": "Justas Galaburda5 hrs ago5 hrs ago",
    "time": "2.00 pm"
  },
  {
    "img": stockDown,
    "title": "Eric Holfman10 hrs ago10 hrs ago",
    "time": "3.00 Am"
  },
  {
    "img": stockDown,
    "title": "Charles Patterson12 hrs ago12 hrs ago",
    "time": "5.00 pm"
  },
];
List drawerList = [
  {
    "img": homeIcon,
    "title": "Dashboard",
    "onTap": () {},
  },
  {
    "img": matualFund,
    "title": "Matual Funds",
    "onTap": () {
      Get.to(MutualFundsScreen());
    },
  },
  {
    "img": research,
    "title": "Research",
    "onTap": () {
      Get.to(ResearchScreen());
    },
  },
  {
    "img": bell,
    "title": "Price alert",
    "onTap": () {
      Get.to(PriceAlertScreen());
    },
  },
  {
    "img": ipo,
    "title": "IPO",
    "onTap": () {
      Get.to(IPOScreen());
    },
  },
  {
    "img": calculator,
    "title": "Margin Calculator",
    "onTap": () {
      Get.to(MarginCalculatorScreen());
    },
  },
  {
    "img": gold,
    "title": "Gold",
    "onTap": () {
      Get.to(GoldScreen());
    },
  },
  {
    "img": logOut,
    "title": "Sign out",
    "onTap": () {
      logOutDialog();
    },
  },
];
const List bottomSheetListBuild = [
  {
    "img": rupee,
    "title": "NSE",
  },
  {
    "img": rupee,
    "title": "BSE",
  },
  {
    "img": AZ,
    "title": "Alphabetically",
  },
  {
    "img": arrow,
    "title": "Last Traded Prise",
  },
];
const List watchListPageBuildDesign = [
  {
    "img": AXISBANK,
    "title": "AXISBANK",
    "subTitle": "NSE",
    "totalRs": "2126.20",
    "stock1": "+30.00",
    "stock2": "+0.72%",
    "color": green,
  },
  {
    "img": YESBANK,
    "title": "YESBANK",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "-15.00",
    "stock2": "-1.00%",
    "color": redEB5757,
  },
  {
    "img": HDFCBANK,
    "title": "HDFCBANK",
    "subTitle": "BSE",
    "totalRs": "1085.00",
    "stock1": "+45.00 ",
    "stock2": "+0.01%",
    "color": green,
  },
  {
    "img": PARLE,
    "title": "PARLE",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "+15.00",
    "stock2": "+1.00%",
    "color": green,
  },
  {
    "img": AXISBANK,
    "title": "AXISBANK",
    "subTitle": "NSE",
    "totalRs": "2126.20",
    "stock1": "+30.00",
    "stock2": "+0.72%",
    "color": green,
  },
  {
    "img": YESBANK,
    "title": "YESBANK",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "-15.00",
    "stock2": "-1.00%",
    "color": redEB5757,
  },
  {
    "img": HDFCBANK,
    "title": "HDFCBANK",
    "subTitle": "BSE",
    "totalRs": "1085.00",
    "stock1": "+45.00 ",
    "stock2": "+0.01%",
    "color": green,
  },
  {
    "img": PARLE,
    "title": "PARLE",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "+15.00",
    "stock2": "+1.00%",
    "color": green,
  },
  
  /*{
    "img": RELIANCE,
    "title": "AXISBANK",
    "subTitle": "NSE",
    "totalRs": "2126.20",
    "stock1": "+30.00",
    "stock2": "+0.72%",
    "color": green,
  },
  {
    "img": Sunpharma,
    "title": "YESBANK",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "-15.00",
    "stock2": "-1.00%",
    "color": redEB5757,
  },
  {
    "img": ICICIBANK,
    "title": "YESBANK",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "-15.00",
    "stock2": "-1.00%",
    "color": redEB5757,
  },*/
];
const List watchListPageBuildDesignMostStock = [
  {
    "img": arrowDownRight,
    "title": "RELIANCE",
    "subTitle": "NSE",
    "totalRs": "2510.20",
    "stock1": "+15.00",
    "stock2": "+1.00%",
    "color": green,
  },
  {
    "img": downIcon,
    "title": "CADILA",
    "subTitle": "NSE",
    "totalRs": "252.02",
    "stock1": "-45.10",
    "stock2": "-2.48%",
    "color": redEB5757,
  },
  {
    "img": arrowDownRight,
    "title": "HDFC BANK",
    "subTitle": "NSE",
    "totalRs": "2510.20",
    "stock1": "+15.65",
    "stock2": "+1.00%",
    "color": green,
  },
  {
    "img": arrowDownRight,
    "title": "ICICI BANK",
    "subTitle": "NSE",
    "totalRs": "451.20",
    "stock1": "+59.20",
    "stock2": "+2.50%",
    "color": green,
  },
  {
    "img": downIcon,
    "title": "TCS",
    "subTitle": "NSE",
    "totalRs": "1458.02",
    "stock1": "-35.10",
    "stock2": "-1.48%",
    "color": redEB5757,
  },
  /*{
    "img": Sunpharma,
    "title": "YESBANK",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "-15.00",
    "stock2": "-1.00%",
    "color": redEB5757,
  },
  {
    "img": ICICIBANK,
    "title": "YESBANK",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "-15.00",
    "stock2": "-1.00%",
    "color": redEB5757,
  },*/
];
const List mostActiveAllStocksScreenList = [
  {
    "img": arrowDownRight,
    "title": "RELIANCE",
    "subTitle": "NSE",
    "totalRs": "2510.20",
    "stock1": "+15.00",
    "stock2": "+1.00%",
    "color": green,
  },
  {
    "img": downIcon,
    "title": "CADILA",
    "subTitle": "NSE",
    "totalRs": "252.02",
    "stock1": "-45.10",
    "stock2": "-2.48%",
    "color": redEB5757,
  },
  {
    "img": arrowDownRight,
    "title": "HDFC BANK",
    "subTitle": "NSE",
    "totalRs": "2510.20",
    "stock1": "+15.65",
    "stock2": "+1.00%",
    "color": green,
  },
  {
    "img": arrowDownRight,
    "title": "ICICI BANK",
    "subTitle": "NSE",
    "totalRs": "451.20",
    "stock1": "+59.20",
    "stock2": "+2.50%",
    "color": green,
  },
  {
    "img": downIcon,
    "title": "TCS",
    "subTitle": "NSE",
    "totalRs": "1458.02",
    "stock1": "-35.10",
    "stock2": "-1.48%",
    "color": redEB5757,
  },
  {
    "img": arrowDownRight,
    "title": "RELIANCE",
    "subTitle": "NSE",
    "totalRs": "2510.20",
    "stock1": "+15.00",
    "stock2": "+1.00%",
    "color": green,
  },
  {
    "img": downIcon,
    "title": "CADILA",
    "subTitle": "NSE",
    "totalRs": "252.02",
    "stock1": "-45.10",
    "stock2": "-2.48%",
    "color": redEB5757,
  },
  {
    "img": arrowDownRight,
    "title": "HDFC BANK",
    "subTitle": "NSE",
    "totalRs": "2510.20",
    "stock1": "+15.65",
    "stock2": "+1.00%",
    "color": green,
  },
  {
    "img": arrowDownRight,
    "title": "ICICI BANK",
    "subTitle": "NSE",
    "totalRs": "451.20",
    "stock1": "+59.20",
    "stock2": "+2.50%",
    "color": green,
  },
  {
    "img": downIcon,
    "title": "TCS",
    "subTitle": "NSE",
    "totalRs": "1458.02",
    "stock1": "-35.10",
    "stock2": "-1.48%",
    "color": redEB5757,
  },
];
const List watchListPageBuildDesignRecentStocks = [];
const List allStockScreenList = [
  {
    "img": AXISBANK,
    "title": "AXISBANK",
    "subTitle": "NSE",
    "totalRs": "2126.20",
    "stock1": "+30.00",
    "stock2": "+0.72%",
    "color": green,
  },
  {
    "img": YESBANK,
    "title": "YESBANK",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "-15.00",
    "stock2": "-1.00%",
    "color": redEB5757,
  },
  {
    "img": HDFCBANK,
    "title": "HDFCBANK",
    "subTitle": "BSE",
    "totalRs": "1085.00",
    "stock1": "+45.00",
    "stock2": "+0.01%",
    "color": green,
  },
  {
    "img": PARLE,
    "title": "PARLE",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "+15.00",
    "stock2": "+1.00%",
    "color": green,
  },
  {
    "img": RELIANCE,
    "title": "AXISBANK",
    "subTitle": "NSE",
    "totalRs": "2126.20",
    "stock1": "+30.00",
    "stock2": "+0.72%",
    "color": green,
  },
  {
    "img": Sunpharma,
    "title": "YESBANK",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "-15.00",
    "stock2": "-1.00%",
    "color": redEB5757,
  },
  {
    "img": HDFCBANK,
    "title": "HDFCBANK",
    "subTitle": "BSE",
    "totalRs": "2510.20",
    "stock1": "+15.65",
    "stock2": "+1.00%",
    "color": green,
  },
  {
    "img": ICICIBANK,
    "title": "YESBANK",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "-15.00",
    "stock2": "-1.00%",
    "color": redEB5757,
  },
  {
    "img": YESBANK,
    "title": "YESBANK",
    "subTitle": "NSE",
    "totalRs": "245.20",
    "stock1": "-15.00",
    "stock2": "-1.00%",
    "color": redEB5757,
  },
];
const List executedListPageBuildDesign = [
  {
    "img": AXISBANK,
    "con1Color": red,
    "con1Text": "Sell",
    "bankName": "AXISBANK",
    "orderPrice": "2126",
    "con2Color": green219653,
    "con2Text": "COMPLETE",
    "ltp": "2126.20",
  },
  {
    "img": ICICIBANK,
    "con1Color": deepOrange,
    "con1Text": "Buy",
    "bankName": "ICICIBANK",
    "orderPrice": "354",
    "con2Color": red,
    "con2Text": "Reject",
    "ltp": "325.20",
  },
  {
    "img": PARLE,
    "con1Color": red,
    "con1Text": "BUY",
    "bankName": "AXISBANK",
    "orderPrice": "354",
    "con2Color": green219653,
    "con2Text": "COMPLETE",
    "ltp": "325.20",
  },
  {
    "img": AXISBANK,
    "con1Color": red,
    "con1Text": "Sell",
    "bankName": "AXISBANK",
    "orderPrice": "2126",
    "con2Color": green219653,
    "con2Text": "COMPLETE",
    "ltp": "2126.20",
  },
  {
    "img": ICICIBANK,
    "con1Color": deepOrange,
    "con1Text": "Buy",
    "bankName": "ICICIBANK",
    "orderPrice": "354",
    "con2Color": red,
    "con2Text": "Reject",
    "ltp": "325.20",
  },
  {
    "img": PARLE,
    "con1Color": red,
    "con1Text": "BUY",
    "bankName": "AXISBANK",
    "orderPrice": "354",
    "con2Color": green219653,
    "con2Text": "COMPLETE",
    "ltp": "325.20",
  },
];
const List pendingListPageBuildDesign = [
  {
    "img": YESBANK,
    "con1Color": red,
    "con1Text": "Sell",
    "bankName": "YESBANK",
    "orderPrice": "2126",
    "con2Color": green219653,
    "con2Text": "PENDING",
    "ltp": "2126.20",
  },
  {
    "img": ICICIBANK,
    "con1Color": deepOrange,
    "con1Text": "Buy",
    "bankName": "ICICIBANK",
    "orderPrice": "354",
    "con2Color": green219653,
    "con2Text": "PENDING",
    "ltp": "325.20",
  },
  {
    "img": PARLE,
    "con1Color": red,
    "con1Text": "BUY",
    "bankName": "AXISBANK",
    "orderPrice": "354",
    "con2Color": green219653,
    "con2Text": "PENDING",
    "ltp": "325.20",
  },
  {
    "img": YESBANK,
    "con1Color": red,
    "con1Text": "Sell",
    "bankName": "YESBANK",
    "orderPrice": "2126",
    "con2Color": green219653,
    "con2Text": "PENDING",
    "ltp": "2126.20",
  },
  {
    "img": ICICIBANK,
    "con1Color": deepOrange,
    "con1Text": "Buy",
    "bankName": "ICICIBANK",
    "orderPrice": "354",
    "con2Color": green219653,
    "con2Text": "PENDING",
    "ltp": "325.20",
  },
  {
    "img": PARLE,
    "con1Color": red,
    "con1Text": "BUY",
    "bankName": "AXISBANK",
    "orderPrice": "354",
    "con2Color": green219653,
    "con2Text": "PENDING",
    "ltp": "325.20",
  },
];
const List currentListPageBuildDesign = [
  {
    "qty": "1",
    "img": AXISBANK,
    "bankName": "AXISBANK",
    "avgText": "2095.00",
    "profileText1": "+217.95",
    "profileText2": "+2.20%",
    "profileColor": green219653,
    "conText": "10200.00",
    "ltp": "2126.20",
  },
  {
    "qty": "1",
    "img": AXISBANK,
    "bankName": "AXISBANK",
    "avgText": "2095.00",
    "profileText1": "+217.95",
    "profileText2": "+2.20%",
    "profileColor": green219653,
    "conText": "10200.00",
    "ltp": "2126.20",
  },
  {
    "qty": "1",
    "img": AXISBANK,
    "bankName": "AXISBANK",
    "avgText": "2095.00",
    "profileText1": "+217.95",
    "profileText2": "+2.20%",
    "profileColor": green219653,
    "conText": "10200.00",
    "ltp": "2126.20",
  },
  {
    "qty": "1",
    "img": AXISBANK,
    "bankName": "AXISBANK",
    "avgText": "2095.00",
    "profileText1": "+217.95",
    "profileText2": "+2.20%",
    "profileColor": green219653,
    "conText": "10200.00",
    "ltp": "2126.20",
  },
  {
    "qty": "10",
    "img": ICICIBANK,
    "bankName": "ICICIBANK",
    "avgText": "254.00",
    "profileText1": "-150.00",
    "profileText2": "+0.20%",
    "profileColor": redEB5757,
    "conText": "20000.00",
    "ltp": "250.20",
  },
];

const List holdingListPageBuildDesign = [
  {
    "qty": "1",
    "img": AXISBANK,
    "bankName": "AXISBANK",
    "avgText": "2095.00",
    "profileText1": "+217.95",
    "profileText2": "+2.20%",
    "profileColor": green219653,
    "conText": "10200.00",
    "ltp": "2126.20",
  },
  {
    "qty": "1",
    "img": AXISBANK,
    "bankName": "AXISBANK",
    "avgText": "2095.00",
    "profileText1": "+217.95",
    "profileText2": "+2.20%",
    "profileColor": green219653,
    "conText": "10200.00",
    "ltp": "2126.20",
  },
  {
    "qty": "1",
    "img": AXISBANK,
    "bankName": "AXISBANK",
    "avgText": "2095.00",
    "profileText1": "+217.95",
    "profileText2": "+2.20%",
    "profileColor": green219653,
    "conText": "10200.00",
    "ltp": "2126.20",
  },
  {
    "qty": "1",
    "img": AXISBANK,
    "bankName": "AXISBANK",
    "avgText": "2095.00",
    "profileText1": "+217.95",
    "profileText2": "+2.20%",
    "profileColor": green219653,
    "conText": "10200.00",
    "ltp": "2126.20",
  },
  {
    "qty": "10",
    "img": ICICIBANK,
    "bankName": "ICICIBANK",
    "avgText": "254.00",
    "profileText1": "-150.00",
    "profileText2": "+0.20%",
    "profileColor": redEB5757,
    "conText": "20000.00",
    "ltp": "250.20",
  },
];
const List bookedListPageBuildDesign = [
  {
    "qty": "01",
    "img": PARLE,
    "bankName": "PARLE",
    "avgText": "2095.00",
    "profileText1": "+217.95",
    "profileText2": "+2.20%",
    "profileColor": green219653,
    "ltp": "2126.20",
  },
  {
    "qty": "01",
    "img": YESBANK,
    "bankName": "YESBANK",
    "avgText": "2095.00",
    "profileText1": "+217.95",
    "profileText2": "+2.20%",
    "profileColor": green219653,
    "ltp": "2126.20",
  },
];

logOutDialog() {
  return Get.defaultDialog(
    barrierDismissible: true,
    title: "",
    contentPadding: EdgeInsets.all(0),
    titlePadding: EdgeInsets.all(0),
    content: Container(
      width: Get.width,
      child: Column(
        children: [
          SvgPicture.asset(
            logOut,
            color: redEB5757,
            height: 43,
          ),
          SizedBox(
            height: 23,
          ),
          Text(
            "Are you sure you want to Logout.?",
            style: TextStyle(
              color: black,
              fontFamily: "NunitoSemiBold",
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                height: 39,
                minWidth: 118,
                onPressed: () {
                  Get.off(WelcomeScreen());
                },
                color: white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: black2, width: 1),
                  borderRadius: BorderRadiusDirectional.circular(
                    12,
                  ),
                ),
                child: Text(
                  "Yes",
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontFamily: "NunitoBold",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 22,
              ),
              MaterialButton(
                height: 39,
                minWidth: 118,
                onPressed: () {
                  Get.back();
                },
                color: appColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(
                    12,
                  ),
                ),
                child: Text(
                  "No",
                  style: TextStyle(
                    color: white,
                    fontSize: 18,
                    fontFamily: "NunitoBold",
                    fontWeight: FontWeight.w700,
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
