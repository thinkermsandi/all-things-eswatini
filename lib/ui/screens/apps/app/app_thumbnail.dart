import 'package:flutter/material.dart';

class AppThumbnail extends StatelessWidget {
  final String url;

  AppThumbnail({this.url});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: NetworkImage(url),
      placeholder: AssetImage('assets/images/placeholder.jpg'),
      height: 32.0,
      width: 32.0,
      fadeOutDuration: new Duration(seconds: 1),
      fadeInDuration: new Duration(seconds: 1),
      fit: BoxFit.cover,
    );
  }

}