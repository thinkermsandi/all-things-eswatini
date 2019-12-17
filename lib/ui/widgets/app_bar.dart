import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final String title;
  final IconData leftIcon;
  final IconData rightIcon;

  const MainAppBar({Key key, this.title, this.leftIcon, this.rightIcon}) : super(key: key);

  Widget _buildIcon(IconData icon, onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: Colors.black,
          size: 24.0,
        ),
      ),
    );
  }

  _leftIconPressed(context){
    Navigator.pop(context);
  }

  _rightIconPressed(context){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
      child: Row(
        children: <Widget>[
          leftIcon != null ? _buildIcon(leftIcon, () => _leftIconPressed(context)) : Container(),
          Expanded(
            child: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.title,),
          ),
          rightIcon != null ? _buildIcon(rightIcon, () => _rightIconPressed(context)) : Container(),
        ],
      ),
    );
  }
}