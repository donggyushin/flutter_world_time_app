import 'package:flutter/material.dart';
import 'package:world_time/models/worldtime.dart';
import 'package:world_time/pages/location/locationLoading/locationLoading.dart';

class Location extends StatefulWidget {
  static const RouteName = '/location';
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool loading = false;

  List<WorldTimeModel> locations = [
    WorldTimeModel(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTimeModel(
        url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTimeModel(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTimeModel(
        url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTimeModel(
        url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTimeModel(
        url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTimeModel(
        url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTimeModel(
        url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  updateTimeAndPop(WorldTimeModel worldTimeModel) async {
    await worldTimeModel.getTime();
    Navigator.pop(context, worldTimeModel);
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        body: Center(
          child: LocationLoading(),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('Searching Location'),
            backgroundColor: Colors.blue[900],
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      loading = true;
                    });
                    updateTimeAndPop(locations[index]);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/${locations[index].flag}"),
                  ),
                ),
              );
            },
            itemCount: locations.length,
          ));
    }
  }
}
