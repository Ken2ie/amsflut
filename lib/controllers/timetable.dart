import 'dart:convert';

import 'package:get/get.dart';

import '../api_services/d.dart';

class TimetableController extends GetxController{
  RxBool loading = false.obs;
  Items? items;

  @override
  void onInit() {
    super.onInit();
  
    
  }


  void getItems() async {
    // var response = await NetworkHandler.get("", "");
    // items = Items.fromJson(json.decode(response));
  }
}