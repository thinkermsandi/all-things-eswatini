import 'package:flutter/material.dart';

import 'package:all_things_eswatini/model/weather.dart';

class WeatherCurrentLocation extends StatelessWidget {
  final Weather report;

  WeatherCurrentLocation({
    @required this.report,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('${report.temp.toString()}°C', style: Theme.of(context).textTheme.headline,),
        Text(report.station.name, style: Theme.of(context).textTheme.subhead,),
      ],
    );
  }
}