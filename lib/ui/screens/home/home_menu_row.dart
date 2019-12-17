import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/home/home_menu_item.dart';

class HomeMenuRow extends StatelessWidget {
  final firstLabel;
  final IconData firstIcon;
  final firstIconCircleColor;
  final secondLabel;
  final IconData secondIcon;
  final secondIconCircleColor;
  final thirdLabel;
  final IconData thirdIcon;
  final thirdIconCircleColor;
  final fourthLabel;
  final IconData fourthIcon;
  final fourthIconCircleColor;

  const HomeMenuRow({Key key,
    this.firstLabel,
    this.firstIcon,
    this.firstIconCircleColor,
    this.secondLabel,
    this.secondIcon,
    this.secondIconCircleColor,
    this.thirdLabel,
    this.thirdIcon,
    this.thirdIconCircleColor,
    this.fourthLabel,
    this.fourthIcon,
    this.fourthIconCircleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          HomeMenuItem(
            icon: firstIcon,
            label: firstLabel,
            circleColor: firstIconCircleColor,
          ),
          HomeMenuItem(
            icon: secondIcon,
            label: secondLabel,
            circleColor: secondIconCircleColor,
          ),
          HomeMenuItem(
            icon: thirdIcon,
            label: thirdLabel,
            circleColor: thirdIconCircleColor,
          ),
          HomeMenuItem(
            icon: fourthIcon,
            label: fourthLabel,
            circleColor: fourthIconCircleColor,
          ),
        ],
      ),
    );
  }
}