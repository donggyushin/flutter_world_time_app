import 'package:flutter/material.dart';
import 'package:world_time/models/worldtime.dart';
import 'package:world_time/pages/home/button_to_location/buttonToLocation.dart';
import 'package:world_time/pages/home/time_location/timeLocation.dart';
import 'package:world_time/pages/location/location.dart';

class HomeArguments {
  String location;
  String flag;
  String time;
  bool isDayToday;

  HomeArguments(
      {@required this.location,
      @required this.flag,
      @required this.time,
      @required this.isDayToday});
}

class Home extends StatefulWidget {
  static const RouteName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeArguments homeArguments;

  moveToLocationScreen() async {
    dynamic result = await Navigator.pushNamed(context, Location.RouteName);
    print("result: ${result.time}");
    setState(() {
      homeArguments.flag = result.flag;
      homeArguments.isDayToday = result.isDayTime;
      homeArguments.location = result.location;
      homeArguments.time = result.time;
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomeArguments args = ModalRoute.of(context).settings.arguments;
    homeArguments = homeArguments == null ? args : homeArguments;
    print("homeArguments: ${homeArguments.location}");
    String bgImage = homeArguments.isDayToday ? "day.png" : "night.png";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$bgImage"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                ButtonToLocation(
                  moveToLocationScreen: moveToLocationScreen,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          homeArguments.location,
                          style: TextStyle(
                            fontSize: 22,
                            letterSpacing: 1.4,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(homeArguments.time,
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
