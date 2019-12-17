import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:all_things_eswatini/model/weather.dart';

class WeatherListItem extends StatelessWidget {
  final Weather report;
  final VoidCallback onTapped;

  WeatherListItem({
    @required this.report,
    @required this.onTapped
  });

  @override
  Widget build(BuildContext context) {
    String condition = Weather.mapWeatherConditionToString(report.condition);

    final stationCard = new Container(
      padding: EdgeInsets.all(8.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.0),
        boxShadow: [
          BoxShadow(blurRadius: 2, spreadRadius: 1, color: Colors.black.withOpacity(0.1),),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(report.station.name, style: new TextStyle(color: Colors.black)),
          Text(condition, style: new TextStyle(color: Colors.black, fontSize: 24.0)),
          //Image.network('https://openweathermap.org/img/w/${condition}.png'),
          Text('min: ${report.minTemp.toString()}°C', style: new TextStyle(color: Colors.black)),
          Text('max: ${report.maxTemp.toString()}°C', style: new TextStyle(color: Colors.black)),
        ],
      ),
    );

    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
      margin: EdgeInsets.all(6.0),
      child: Material(
        child: InkWell(
          onTap: onTapped,
          child: Container(
            child: new Stack(
              children: <Widget>[
                stationCard
              ],
            ),
          ),
        ),
      ),
    );
  }

}