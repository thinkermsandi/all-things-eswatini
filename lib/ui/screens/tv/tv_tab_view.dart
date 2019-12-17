import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/tv/tv_list.dart';

class TvTabView extends StatelessWidget {
  final TabController _tabController;

  const TvTabView({
    Key key,
    @required TabController tabController,
  }) : _tabController = tabController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          TvList(key: Key('eswatini_tv')),
          TvList(key: Key('channel_s')),
        ],
      ),
    );
  }
}