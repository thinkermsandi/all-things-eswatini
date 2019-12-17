import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  final String title;
  final String primaryText;
  final String secondaryText;
  final IconData icon;
  final Color iconColor;

  const Introduction({@required this.title, this.primaryText = "", this.secondaryText = "", this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline,),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.subtitle,
                        children: <TextSpan>[
                          TextSpan(text: '$primaryText\n',),
                          TextSpan(text: secondaryText),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Icon(icon, size: 35.0, color: iconColor,),
          ],
        )
    );
  }
}