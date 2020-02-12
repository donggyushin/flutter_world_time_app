import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTimeModel {
  String url;
  String flag;
  String time;
  String location;

  WorldTimeModel(
      {@required this.url, @required this.flag, @required this.location});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        this.time = data["datetime"];
      } else {
        print("fail to fetch data");
        this.time = "fail to fetch data";
      }
    } catch (err) {
      this.time = "fail to fetch data";
    }
  }
}
