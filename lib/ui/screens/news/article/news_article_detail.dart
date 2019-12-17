import 'package:flutter/material.dart';

import 'package:all_things_eswatini/model/news_article.dart';

class NewsArticleDetail extends StatelessWidget {
  final NewsArticle article;

  NewsArticleDetail({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0, bottom: 40.0),
            child: Text(article.description, style: infoDetailsStyle,),
          ),
        )
      ],
    );

  }

  static const TextStyle titleStyle = const TextStyle(
    color: Colors.black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  );

  static const TextStyle infoDetailsStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  );

  static const TextStyle infoExtraDetailsStyle = const TextStyle(
      color: const Color(0xff7a7a7a),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0
  );

}