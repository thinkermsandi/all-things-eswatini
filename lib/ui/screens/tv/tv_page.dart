import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/widgets/app_bar.dart';
import 'package:all_things_eswatini/ui/screens/tv/tv_content.dart';

class TvPage extends StatelessWidget {

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
                MainAppBar(title: "TV", leftIcon: Icons.arrow_back,),
                SizedBox(height: 12.0,),
                TvContent(),
                SizedBox(height: 16.0,),
              ],
            )
        ),
      ),
    );
  }
}