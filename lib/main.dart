import 'package:flutter/material.dart';
import 'package:world_time/pages/home/home.dart';
import 'package:world_time/pages/loading/loading.dart';
import 'package:world_time/pages/location/location.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Location()
      },
    ));
