import 'dart:convert';
import 'package:chalenger/models/global_user_data_model.dart';


UserData userDataFromJson(String str) =>
  UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData ({
    required this.data
  });

  List<GlobalUserData> data;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    data: List<GlobalUserData>.from(json["data"].map((x) => UserData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}