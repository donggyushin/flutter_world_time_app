import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeModel {
  String url;
  String flag;
  String time;
  String location;
  bool isDayTime;

  WorldTimeModel(
      {@required this.url, @required this.flag, @required this.location});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      if (response.statusCode == 200) {
        print("response: ${response.body}");
        Map data = jsonDecode(response.body);
        String offSet = data["utc_offset"];
        DateTime dateTime = DateTime.parse(data["datetime"]);
        dateTime = dateTime
            .add(new Duration(hours: int.parse(offSet.substring(1, 3))));
        this.time = DateFormat('jm').format(dateTime);
        isDayTime = dateTime.hour > 6 && dateTime.hour < 20 ? true : false;
      } else {
        print("fail to fetch data");
        this.time = "fail to fetch data";
      }
    } catch (err) {
      this.time = "fail to fetch data";
    }
  }
}
