import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:all_things_eswatini/model/tv_show.dart';

class TvListItemChip extends StatelessWidget {
  final TvShow show;

  TvListItemChip(this.show);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF21316B),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.only(top: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Text(
        show.rating,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
          color: Color(0xFFFEFEFE),
        ),
      ),
    );
  }
}