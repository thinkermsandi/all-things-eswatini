import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:all_things_eswatini/ui/screens/apps/apps_list_item.dart';
import 'package:all_things_eswatini/ui/screens/apps/app/app_page.dart';
import 'package:all_things_eswatini/ui/screens/apps/section/apps_section_page.dart';
import 'package:all_things_eswatini/model/loading_status.dart';
import 'package:all_things_eswatini/model/mobile_app.dart';
import 'package:all_things_eswatini/model/mobile_app_section.dart';
import 'package:all_things_eswatini/redux/state.dart';
import 'package:all_things_eswatini/util/navigation_utils.dart';

class AppsListSection extends StatelessWidget {
  final MobileAppSection section;

  AppsListSection({Key key, @required this.section,}) : super(key: key);

  void _viewSection(BuildContext context, MobileAppSection section) {
    materialNavigateTo(context, AppsSectionPage(section: section));
  }

  void _viewApp(BuildContext context, MobileApp app) {
    materialNavigateTo(context, AppPage(app: app));
  }

  _buildHeader(BuildContext context, MobileAppSection section) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          section.title,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        GestureDetector(
          onTap: () => _viewSection(context, section),
          child: Text(
            "MORE",
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
      ],
    ),
  );

  _buildSection(BuildContext context, List<MobileApp> apps) => SizedBox(
    height: 170.0,
    child: new ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: apps.length,
      itemExtent: 100.0,
      itemBuilder: (BuildContext context, int index) {
        return AppsListItem(app: apps[index], onTapped: () => _viewApp(context, apps[index]),);
      },
    ),
  );

  _buildSectionEmptyApps(BuildContext context) => SizedBox(
    height: 170.0,
    child: Center(
        child: Text(
          'No apps available...',
          style: Theme.of(context).textTheme.subtitle,
        )
    ),
  );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        List<MobileApp> apps = vm.apps;

        return Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
            child: Column(children: <Widget>[
              _buildHeader(context, section),
              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 20.0),
                child: apps.length > 0 ? _buildSection(context, apps) : _buildSectionEmptyApps(context),
              ),
            ]),
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