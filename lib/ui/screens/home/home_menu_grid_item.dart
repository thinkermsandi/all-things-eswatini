import 'package:flutter/material.dart';

import 'package:all_things_eswatini/model/menu.dart';
import 'package:all_things_eswatini/config/constants.dart';

class HomeMenuGridItem extends StatelessWidget {
  final Menu menu;
  final VoidCallback onTapped;
  final iconColor;
  final isCircleEnabled;
  final betweenHeight;

  HomeMenuGridItem({
    @required this.menu,
    @required this.onTapped,
    this.iconColor = Colors.white,
    this.isCircleEnabled = true,
    this.betweenHeight = 5.0
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          isCircleEnabled ? CircleAvatar(
            backgroundColor: menu.menuColor,
            radius: 20.0,
            child: Icon(menu.icon, size: 12.0, color: iconColor,),
          ) : Icon(menu.icon, size: 23.0, color: iconColor,),
          SizedBox(height: betweenHeight,),
          Text(menu.title, textAlign: TextAlign.center, style: TextStyle(fontFamily: Constants.ralewayFont),)
        ],
      ),
    );
  }
}