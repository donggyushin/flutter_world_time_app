import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/models/worldtime.dart';

class LocationLoading extends StatefulWidget {
  static const RouteName = '/location/loading';

  @override
  _LocationLoadingState createState() => _LocationLoadingState();
}

class _LocationLoadingState extends State<LocationLoading> {
  WorldTimeModel worldTimeModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final WorldTimeModel args = ModalRoute.of(context).settings.arguments;
    worldTimeModel = args;
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
