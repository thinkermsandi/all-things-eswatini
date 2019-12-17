import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/tv/show/tv_show_header.dart';
import 'package:all_things_eswatini/ui/screens/tv/show/tv_show_detail.dart';
import 'package:all_things_eswatini/model/tv_show.dart';

class TvShowPage extends StatelessWidget {

  final TvShow show;

  TvShowPage({Key key, @required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.white,
              Colors.grey[200],
            ],
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            child: Stack(
              children: <Widget>[
                CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: TvShowHeader(show: show),
                    ),
                    SliverToBoxAdapter(
                      child: TvShowDetail(show: show),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}