import 'dart:convert';

import 'package:chalenger/models/data_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class UserDataController extends GetxController {
  UserData? userData;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future <void> getData() async {
    var response = await rootBundle.loadString('assets/data.json');
    userData = UserData.fromJson(json.decode(response));
  }
}