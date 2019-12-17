import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/news/news_list.dart';

class NewsTabView extends StatelessWidget {
  final TabController _tabController;

  const NewsTabView({
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
          NewsList(key: Key('national')),
          NewsList(key: Key('business')),
          NewsList(key: Key('features')),
          NewsList(key: Key('entertainment')),
          NewsList(key: Key('sports')),
        ],
      ),
    );
  }
}