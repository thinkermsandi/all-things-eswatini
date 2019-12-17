import 'package:flutter/material.dart';

class JobEmployerThumbnail extends StatelessWidget {
  final String url;

  JobEmployerThumbnail({this.url});

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