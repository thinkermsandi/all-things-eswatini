import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/weather/station/station_content.dart';
import 'package:all_things_eswatini/ui/widgets/app_bar_white.dart';
import 'package:all_things_eswatini/model/weather.dart';

class StationPage extends StatelessWidget {

  final Weather station;

  StationPage({Key key, @required this.station}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.99],
            colors: [
              Colors.deepPurple.shade900,
              Colors.indigo,
            ],
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
            child: Column(
              children: <Widget>[
                AppBarWhite(leftIcon: Icons.arrow_back,),
                SizedBox(
                  height: 10.0,
                ),
                StationContent(station: station),
              ],
            ),
          ),
        ),
      ),
    );

  }
}