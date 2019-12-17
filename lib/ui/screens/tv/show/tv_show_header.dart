import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/tv/show/tv_show_thumbnail.dart';
import 'package:all_things_eswatini/ui/widgets/app_bar_white.dart';
import 'package:all_things_eswatini/model/tv_show.dart';

class TvShowHeader extends StatefulWidget {
  final TvShow show;

  TvShowHeader({Key key, @required this.show}) : super(key: key);

  @override
  _TvShowHeaderState createState() => _TvShowHeaderState();

}

class _TvShowHeaderState extends State<TvShowHeader> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation t1, elevationAnimation, t3, buttonBounceInAnimation, t5, buttonBounceOutAnimation, c;

  @override
  void initState() {
    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

    elevationAnimation = new Tween(begin: 0.0, end: 4.0).animate(animationController);
    buttonBounceInAnimation = CurvedAnimation(parent: animationController, curve: new Interval(0.7, 1.0, curve: Curves.decelerate),);
    buttonBounceOutAnimation = new Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: animationController, curve: new Interval(0.6, 0.7, curve: Curves.bounceInOut)));
    c = CurvedAnimation(parent: animationController.view, curve: Interval(0.0, 0.6));
    t5 = new Tween(begin: 220.0, end: 350.0).animate(c);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    t1 = new Tween(begin: maxWidth, end: maxWidth * 0.6).animate(c);
    t3 = new Tween(begin: 10.0, end: (maxWidth / 2) - 30).animate(c);

    return Stack(
      children: <Widget>[
        _buildShowImage(),
        _buildFAB(),
      ],
    );
  }

  Widget _buildShowImage() {
    return Column(
      children: <Widget>[
        Center(
          child: AnimatedBuilder(
            animation: t1,
            builder: (BuildContext context, Widget child) {
              return Container(
                margin: EdgeInsets.only(top: animationController.value * 50),
                width: t1.value,
                height: 290.0,
                child: Material(elevation: elevationAnimation.value, child: child,),
              );
            },
            child: TvShowThumbnail(url: widget.show.url,),
          ),
        ),
      ],
    );
  }

  Widget _buildFAB(){
    return AnimatedBuilder(
      animation: t3,
      builder: (context, child) {
        return Positioned(
          right: t3.value,
          top: t5.value,
          child: Transform.scale(scale: buttonBounceOutAnimation.value, child: child),
        );
      },
      child: FloatingActionButton(heroTag: "play", child: Icon(Icons.play_arrow), onPressed: () {},),
    );
  }

}