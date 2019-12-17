import 'package:flutter/material.dart';

import 'package:all_things_eswatini/model/mobile_app.dart';

class AppDetail extends StatelessWidget {
  final MobileApp app;

  AppDetail({Key key, @required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Text(app.description, style: infoDetailsStyle,)
        ],
      ),
    );

  }

  static const TextStyle titleStyle = const TextStyle(
    color: Colors.black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  );

  static const TextStyle infoDetailsStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  );

  static const TextStyle infoExtraDetailsStyle = const TextStyle(
      color: const Color(0xff7a7a7a),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0
  );

}