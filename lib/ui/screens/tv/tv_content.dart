import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:all_things_eswatini/ui/screens/tv/tv_tab_view.dart';
import 'package:all_things_eswatini/ui/widgets/tab_bar.dart';
import 'package:all_things_eswatini/model/tabs_tv.dart';
import 'package:all_things_eswatini/redux/action.dart';
import 'package:all_things_eswatini/redux/state.dart';

class TvContent extends StatefulWidget {
  @override
  _TvContentState createState() => _TvContentState();
}

class _TvContentState extends State<TvContent> with SingleTickerProviderStateMixin {
  TabController _tabController;
  Store<AppState> _store;
  final List<Widget> _tabs = [
    Tab(child: Row(children: <Widget>[Text('ESWATINI TV')]),),
    Tab(child: Row(children: <Widget>[Text('CHANNEL S')]),),
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
            _store.dispatch(SetTvTabAction(TvTab.EswatiniTv));
            break;

          case 1:
            _store.dispatch(SetTvTabAction(TvTab.ChannelS));
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
              child: TvTabView(tabController: _tabController),
            )
          ],
        ),
      ),
    );
  }
}