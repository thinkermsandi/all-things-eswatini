import 'package:flutter/material.dart';

class JobListItemThumbnail extends StatelessWidget {
  final id;
  final String url;

  JobListItemThumbnail(this.id, this.url);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: FadeInImage(
        image: NetworkImage(url),
        placeholder: AssetImage('assets/images/placeholder.jpg'),
        height: 70.0,
        width: 70.0,
        fit: BoxFit.cover,
      ),
    );
  }

}