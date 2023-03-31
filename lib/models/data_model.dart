import 'dart:convert';


import 'package:flutter/services.dart';

class DataModel {
  static List items = [];

  Future <void> extractJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response);

    items = data["items"];
  }
}