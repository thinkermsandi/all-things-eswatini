import 'package:flutter/material.dart';

import 'package:all_things_eswatini/util/arc_clipper.dart';
import 'package:all_things_eswatini/util/utils.dart';

class HomeBackground extends StatelessWidget {

  Widget topHalf(BuildContext context) {
    return new Flexible(
      flex: 2,
      child: ClipPath(
        clipper: new ArcClipper(),
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(colors: Utils.appGradients,)
              ),
            ),
          ],
        ),
      ),
    );
  }

  final bottomHalf = new Flexible(
    flex: 3,
    child: new Container(),
  );

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        topHalf(context),
        bottomHalf
      ],
    );
  }
}