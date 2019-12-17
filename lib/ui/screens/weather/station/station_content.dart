import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/weather/station/station_info.dart';
import 'package:all_things_eswatini/model/weather.dart';
import 'package:all_things_eswatini/util/date_time_utils.dart';

class StationContent extends StatelessWidget {

  final Weather station;

  StationContent({Key key, @required this.station}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateTimeUtils.formatDateTime(DateTime.now());

    return Container(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(station.station.name, style: titleStyle),
                  Text(date, style: infoDetailsStyle),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 430,
                    child: StationInfo(station: station),
                  ),
                ]
            )
        )
    );
  }

  static const TextStyle titleStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 28.0
  );

  static const TextStyle infoDetailsStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 20.0
  );

  static const TextStyle infoExtraDetailsStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 18.0
  );

}