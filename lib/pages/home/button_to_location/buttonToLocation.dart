import 'package:flutter/material.dart';
import 'package:world_time/pages/location/location.dart';

class ButtonToLocation extends StatelessWidget {
  final Function moveToLocationScreen;

  ButtonToLocation({@required this.moveToLocationScreen});

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        onPressed: () {
          moveToLocationScreen();
        },
        icon: Icon(
          Icons.location_on,
          color: Colors.grey[200],
        ),
        label: Text(
          "Move to location screen",
          style: TextStyle(
            color: Colors.grey[200],
          ),
        ),
        color: Colors.transparent);
  }
}
