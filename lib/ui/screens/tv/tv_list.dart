import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:all_things_eswatini/ui/screens/tv/tv_list_item.dart';
import 'package:all_things_eswatini/ui/screens/tv/show/tv_show_page.dart';
import 'package:all_things_eswatini/model/loading_status.dart';
import 'package:all_things_eswatini/model/tv_show.dart';
import 'package:all_things_eswatini/model/tabs_tv.dart';
import 'package:all_things_eswatini/redux/state.dart';
import 'package:all_things_eswatini/util/navigation_utils.dart';

class TvList extends StatelessWidget {

  TvList({Key key}) : super(key: key);

  void _viewShow(BuildContext context, TvShow show) {
    //materialNavigateTo(context, TvShowPage(show: show));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        List<TvShow> shows = vm.shows;

        if (shows.length == 0) {
          return Center(child: Text('No shows to display...', style: Theme.of(context).textTheme.subtitle,));
        }

        return Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: new ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: shows.length,
            itemBuilder: (context, i) => new TvListItem(show: shows[i], onTapped: () => _viewShow(context, shows[i]),),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final LoadingStatus status;
  final TvTab currentTab;
  final List<TvShow> shows;

  _ViewModel({
    this.status,
    this.currentTab,
    this.shows,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      status: store.state.tvShowsStatus,
      currentTab: store.state.tvCurrentTab,
      shows: store.state.tvShows,
    );
  }
}