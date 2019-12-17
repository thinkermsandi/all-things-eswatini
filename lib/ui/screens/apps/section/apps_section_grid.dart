import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:all_things_eswatini/ui/screens/apps/section/apps_section_grid_item.dart';
import 'package:all_things_eswatini/ui/screens/apps/app/app_page.dart';
import 'package:all_things_eswatini/model/mobile_app_section.dart';
import 'package:all_things_eswatini/model/loading_status.dart';
import 'package:all_things_eswatini/model/mobile_app.dart';
import 'package:all_things_eswatini/redux/state.dart';
import 'package:all_things_eswatini/util/navigation_utils.dart';

class AppsSectionGrid extends StatelessWidget {
  final MobileAppSection section;

  AppsSectionGrid({Key key, @required this.section}) : super(key: key);

  void _viewApp(BuildContext context, MobileApp app) {
    materialNavigateTo(context, AppPage(app: app));
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final crossAxisChildCount = isPortrait ? 3 : 5;

    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        List<MobileApp> apps = vm.apps;

        return Container(
          margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
          child: new GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            padding: EdgeInsets.all(0.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisChildCount,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1 / 3,
            ),
            itemCount: apps.length,
            itemBuilder: (context, i) => new AppsSectionGridItem(app: apps[i], onTapped: () => _viewApp(context, apps[i])),
          ),
        );
      },
    );

  }

}

class _ViewModel {
  final LoadingStatus status;
  final List<MobileApp> apps;

  _ViewModel({
    this.status,
    this.apps,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      status: store.state.mobileAppsStatus,
      apps: store.state.mobileApps,
    );
  }
}