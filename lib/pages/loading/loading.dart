import 'package:flutter/material.dart';
import 'package:world_time/models/worldtime.dart';
import 'package:world_time/pages/home/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
          time: worldTime.time,
          isDayToday: worldTime.isDayTime,
        ));
  }

  @override
  void initState() {
    super.initState();
    initiateWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
