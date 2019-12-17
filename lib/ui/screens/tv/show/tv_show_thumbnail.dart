import 'package:flutter/material.dart';

class TvShowThumbnail extends StatelessWidget {
  final String url;

  TvShowThumbnail({this.url});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: NetworkImage(url),
      placeholder: AssetImage('assets/images/placeholder.jpg'),
      height: 32.0,
      width: 32.0,
      fit: BoxFit.cover,
    );
  }

}