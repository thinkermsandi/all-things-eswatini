import 'package:flutter/material.dart';

class NewsListItemImage extends StatelessWidget {
  final id;
  final String url;

  NewsListItemImage(this.id, this.url);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: FadeInImage(
        image: NetworkImage(url),
        placeholder: AssetImage('assets/images/placeholder.jpg'),
        height: 90.0,
        width: 90.0,
        fit: BoxFit.cover,
      ),
    );
  }

}