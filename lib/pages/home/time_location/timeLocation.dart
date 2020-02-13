import 'package:flutter/material.dart';

class TimeAndLocation extends StatefulWidget {
  final String time;
  final String location;

  TimeAndLocation({@required this.time, @required this.location});

  @override
  _TimeAndLocationState createState() =>
      _TimeAndLocationState(time: time, location: location);
}

class _TimeAndLocationState extends State<TimeAndLocation> {
  String time;
  String location;

  _TimeAndLocationState({@required this.time, @required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              location,
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
        Text(time,
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ))
      ],
    );
  }
}
