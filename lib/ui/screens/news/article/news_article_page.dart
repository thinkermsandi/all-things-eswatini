import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/screens/news/article/news_article_header.dart';
import 'package:all_things_eswatini/ui/screens/news/article/news_article_detail.dart';
import 'package:all_things_eswatini/model/news_article.dart';

class NewsArticlePage extends StatelessWidget {

  final NewsArticle article;

  NewsArticlePage({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.white,
              Colors.grey[200],
            ],
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            child: Column(
              children: <Widget>[
                NewsArticleHeader(article: article),
                NewsArticleDetail(article: article),
              ],
            ),
          ),
        ),
      ),
    );

  }
}