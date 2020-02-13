import 'package:flutter/material.dart';
import 'package:world_time/pages/location/location.dart';

class ButtonToLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, Location.RouteName);
        },
        icon: Icon(Icons.location_on),
        label: Text("Move to location screen"),
        color: Colors.transparent);
  }
}
