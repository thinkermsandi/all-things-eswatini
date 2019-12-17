import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Menu extends Equatable {
  BuildContext context;
  String title;
  String route;
  IconData icon;
  String image;
  Color menuColor;

  Menu({
    this.context,
    this.title,
    this.route,
    this.icon,
    this.image,
    this.menuColor = Colors.black
  }) : super([
    context,
    title,
    route,
    icon,
    image,
    menuColor,
  ]);

}