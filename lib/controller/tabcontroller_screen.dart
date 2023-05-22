import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabController extends GetxController with SingleGetTickerProviderMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Watchlist 1'),
    Tab(text: 'Watchlist 2'),
    // Tab(text: 'Watchlist 3'),
    // Tab(text: 'Watchlist 4'),
    // Tab(text: 'Watchlist 5'),
  ];
  final List<Tab> myTabs2 = <Tab>[
    Tab(text: 'Pending'),
    Tab(text: 'Executed'),
  ];
  final List<Tab> myTabs3 = <Tab>[
    Tab(text: 'EQUITY'),
    Tab(text: 'COMMODITY'),
  ];
  final List<Container> myTabs4 = <Container>[
    Container(
        height: 30, alignment: Alignment.center, child: Tab(text: 'Current')),
    Container(
        height: 30, alignment: Alignment.center, child: Tab(text: 'Holding')),
    Container(
        height: 30,
        alignment: Alignment.center,
        child: Tab(text: 'Booked P/L')),
  ];
  final List<Tab> myTabs5 = <Tab>[
    Tab(text: 'Day'),
    Tab(text: 'Week'),
    Tab(text: 'Month'),
    Tab(text: 'Year'),
  ];
  final List<String> dropList = [
    "LIMIT",
    "SL",
    "SLM",
  ].obs;
  final List<String> dropList1 = [
    "DAY",
    "se",
    "SLM",
  ].obs;
  var selectedValue = "LIMIT".obs;
  var selectedValue1 = "DAY".obs;

  void setSelected(String value) {
    selectedValue.value = value;
  }

  void setSelected1(String value) {
    selectedValue1.value = value;
  }

  TabController controller;
  TabController controller1;
  TabController controller2;
  TabController controller4;
  TabController controller5;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
    controller1 = TabController(vsync: this, length: myTabs2.length);
    controller2 = TabController(vsync: this, length: myTabs3.length);
    controller4 = TabController(vsync: this, length: myTabs4.length);
    controller5 = TabController(vsync: this, length: myTabs5.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
