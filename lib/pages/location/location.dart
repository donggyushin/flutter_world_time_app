import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  static const RouteName = '/location';
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Searching Location'),
        backgroundColor: Colors.blue[200],
      ),
      body: Text('location screen'),
    );
  }
}
