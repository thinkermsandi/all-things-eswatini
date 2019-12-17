import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:all_things_eswatini/ui/screens/news/news_tab_view.dart';
import 'package:all_things_eswatini/ui/widgets/tab_bar.dart';
import 'package:all_things_eswatini/model/tabs_news.dart';
import 'package:all_things_eswatini/redux/action.dart';
import 'package:all_things_eswatini/redux/state.dart';

class NewsContent extends StatefulWidget {
  @override
  _NewsContentState createState() => _NewsContentState();
}

class _NewsContentState extends State<NewsContent> with SingleTickerProviderStateMixin {
  TabController _tabController;
  Store<AppState> _store;
  final List<Widget> _tabs = [
    Tab(child: Row(children: <Widget>[Text('National')]),),
    Tab(child: Row(children: <Widget>[Text('Business')]),),
    Tab(child: Row(children: <Widget>[Text('Features')]),),
    Tab(child: Row(children: <Widget>[Text('Entertainment')]),),
    Tab(child: Row(children: <Widget>[Text('Sports')]),),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _store = StoreProvider.of<AppState>(context);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        switch (_tabController.index) {
          case 0:
            _store.dispatch(SetNewsTabAction(NewsTab.Top));
            break;

          case 1:
            _store.dispatch(SetNewsTabAction(NewsTab.New));
            break;

          case 2:
            _store.dispatch(SetNewsTabAction(NewsTab.All));
            break;

          case 3:
            _store.dispatch(SetNewsTabAction(NewsTab.All));
            break;

          case 4:
            _store.dispatch(SetNewsTabAction(NewsTab.All));
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0,),
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
      child: Material(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CustomTabBar(tabController: _tabController, tabs: _tabs),
            SizedBox(
              height: 500,
              child: NewsTabView(tabController: _tabController),
            )
          ],
        ),
      ),
    );
  }
}