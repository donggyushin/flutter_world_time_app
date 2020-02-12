import 'package:flutter/material.dart';
import 'package:world_time/pages/home/home.dart';
import 'package:world_time/pages/loading/loading.dart';
import 'package:world_time/pages/location/location.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        Loading.RouteName: (context) => Loading(),
        Home.RouteName: (context) => Home(),
        Location.RouteName: (context) => Location()
      },
    ));
