import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/apps/apps_list_section.dart';
import 'package:all_things_eswatini/model/mobile_app_section.dart';

class AppsList extends StatelessWidget {
  final List<MobileAppSection> sections = [
    new MobileAppSection(key: "featured", title: "Featured Apps"),
    new MobileAppSection(key: "top", title: "Top Apps"),
    new MobileAppSection(key: "new", title: "New Apps"),
  ];

  AppsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0),
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
      child: new ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: sections.length,
        itemBuilder: (context, i) => new AppsListSection(section: sections[i],),
      ),
    );

  }

}