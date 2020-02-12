import 'package:flutter/material.dart';
import 'package:world_time/models/worldtime.dart';
import 'package:world_time/pages/home/home.dart';

class Loading extends StatefulWidget {
  static const RouteName = '/';
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> initiateWorldTime() async {
    WorldTimeModel worldTime = WorldTimeModel(
      url: 'Asia/Seoul',
      location: 'Seoul',
      flag: 'seoul.png',
    );
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, Home.RouteName,
        arguments: HomeArguments(
            location: worldTime.location,
            flag: worldTime.flag,
            time: worldTime.time));
  }

  @override
  void initState() {
    super.initState();
    initiateWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loading..."),
      ),
    );
  }
}
