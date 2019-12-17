import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/apps/app/app_header.dart';
import 'package:all_things_eswatini/ui/screens/apps/app/app_detail.dart';
import 'package:all_things_eswatini/ui/widgets/app_bar_black.dart';
import 'package:all_things_eswatini/model/mobile_app.dart';

class AppPage extends StatelessWidget {

  final MobileApp app;

  AppPage({Key key, @required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 8.0,),
                AppBarBlack(title: "APP INFO", leftIcon: Icons.arrow_back,),
                SizedBox(height: 12.0,),
                AppHeader(app: app,),
                Divider(height: 4, color: Color.fromARGB(255, 163, 163, 163),),
                AppDetail(app: app),
              ],
            ),
          ),
        ),
      ),
    );
  }

}