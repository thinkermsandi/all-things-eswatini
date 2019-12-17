import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/widgets/app_bar.dart';
import 'package:all_things_eswatini/ui/screens/apps/apps_list.dart';

class AppsPage extends StatelessWidget {

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
                MainAppBar(title: "APP STORE", leftIcon: Icons.arrow_back,),
                SizedBox(height: 12.0,),
                AppsList(),
                SizedBox(height: 16.0,),
              ],
            )
        ),
      ),
    );
  }
}