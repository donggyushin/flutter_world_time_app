import 'package:flutter/material.dart';

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
    print(args.location);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(Icons.location_on),
              label: Text("Move to location screen"),
              color: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
