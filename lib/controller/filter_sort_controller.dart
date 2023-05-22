import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterSortController extends GetxController {
  RxBool isLoading = false.obs;
  final txtList = TextEditingController();
  RxString controllerText = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    focusNode.addListener(() {
      isLoading.value = focusNode.hasFocus;
      print("HASFOCUSE ================${isLoading.value}");
    });
    txtList.addListener(() {
      controllerText.value = txtList.text;
    });
    debounce(controllerText, (_) {
      print("debouce$_");
    }, time: Duration(seconds: 1));
    super.onInit();
  }

  // FocusNode _focusNode =  FocusNode().obs;
  FocusNode focusNode = FocusNode();
  var isSelected1 = false.obs;
  var isSelected2 = false.obs;
  var isSelected3 = false.obs;
  var isSelected4 = false.obs;
  var isSelected5 = false.obs;
  var isSelected6 = false.obs;

}

conditionFilter() {
  FilterSortController filterSortController = Get.find();

  if (filterSortController.isSelected1.isTrue ||
      filterSortController.isSelected2.isTrue ||
      filterSortController.isSelected3.isTrue ||
      filterSortController.isSelected4.isTrue ||
      filterSortController.isSelected5.isTrue ||
      filterSortController.isSelected6.isTrue) {
    print("############");
    filterSortController.isSelected1(false);
    filterSortController.isSelected2(false);
    filterSortController.isSelected3(false);
    filterSortController.isSelected4(false);
    filterSortController.isSelected5(false);
    filterSortController.isSelected6(false);
  }
}
