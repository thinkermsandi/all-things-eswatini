import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:all_things_eswatini/ui/screens/tv/tv_list_item_chip.dart';
import 'package:all_things_eswatini/model/tv_show.dart';

class TvListItemInfo extends StatelessWidget {
  final TvShow show;

  TvListItemInfo(this.show);

  @override
  Widget build(BuildContext context) {
    final decoration = const BoxDecoration(
      border: Border(
        left: BorderSide(
          color: Color(0xFF717DAD),
        ),
      ),
    );

    final content = [
      Text(show.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: titleStyle,),
      const SizedBox(height: 4.0),
      Text(show.description, maxLines: 1, overflow: TextOverflow.clip, style: infoDetailsStyle,),
      TvListItemChip(show),
    ];

    return Expanded(
      child: Container(
        decoration: decoration,
        margin: const EdgeInsets.only(left: 12.0),
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: content,
        ),
      ),
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