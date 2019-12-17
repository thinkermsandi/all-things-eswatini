import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:all_things_eswatini/model/tv_show.dart';

class TvListItemShowtime extends StatelessWidget {
  static final hoursAndMins = DateFormat('HH:mm');

  final TvShow show;

  TvListItemShowtime(this.show);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          //hoursAndMins.format(DateTime.parse(show.starts)),
          show.starts,
          style: titleStyle,
        ),
        const SizedBox(height: 4.0),
        Text(
          //hoursAndMins.format(DateTime.parse(show.ends)),
          show.ends,
          style: infoDetailsStyle,
        ),
      ],
    );
  }

  static const TextStyle titleStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 18.0
  );

  static const TextStyle infoDetailsStyle = const TextStyle(
      color: const Color(0xff7a7a7a),
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