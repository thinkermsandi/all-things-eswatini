import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/widgets/app_bar.dart';
import 'package:all_things_eswatini/ui/screens/apps/section/apps_section_grid.dart';
import 'package:all_things_eswatini/model/mobile_app_section.dart';

class AppsSectionPage extends StatelessWidget {
  final MobileAppSection section;

  AppsSectionPage({Key key, @required this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(height: 8.0,),
                MainAppBar(title: section.title.toUpperCase(), leftIcon: Icons.arrow_back,),
                SizedBox(height: 12.0,),
                AppsSectionGrid(section: section),
                SizedBox(height: 16.0,),
              ],
            )
        ),
      ),
    );
  }

}