import 'package:flutter/material.dart';
import 'package:world_time/pages/home/button_to_location/buttonToLocation.dart';
import 'package:world_time/pages/home/time_location/timeLocation.dart';

class HomeArguments {
  final String location;
  final String flag;
  final String time;

  HomeArguments({this.location, this.flag, this.time});
}

class Home extends StatefulWidget {
  static const RouteName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final HomeArguments args = ModalRoute.of(context).settings.arguments;
    print(args);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              ButtonToLocation(),
              TimeAndLocation(
                time: args.time,
                location: args.location,
              )
            ],
          ),
        ),
      ),
    );
  }
}
