import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeago/timeago.dart';
import 'package:random_string/random_string.dart';

import 'package:all_things_eswatini/ui/screens/news/news_list_item_image.dart';
import 'package:all_things_eswatini/model/news_article.dart';

class NewsListItem extends StatelessWidget {
  final NewsArticle article;
  final VoidCallback onTapped;

  NewsListItem({
    @required this.article,
    @required this.onTapped
  });

  @override
  Widget build(BuildContext context) {
    String tag = randomString(5);

    final articleCard = new Container(
      padding: EdgeInsets.all(8.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.0),
        boxShadow: [
          BoxShadow(blurRadius: 2, spreadRadius: 1, color: Colors.black.withOpacity(0.1),),
        ],
      ),
      child: Column(
        children: [
          new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(left: 4.0),
                child: new Text(
                  article.organization.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[600],),
                ),
              ),
              new Expanded(
                child: new Padding(
                  padding: new EdgeInsets.all(5.0),
                  child: new Text(
                    timeAgo(article.created),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: new TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.grey[700],),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          new Row(
            children: [
              new Expanded(
                child: new Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    new Padding(
                      padding: new EdgeInsets.only(left: 4.0, right: 8.0, bottom: 8.0, top: 8.0),
                      child: new Text(article.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(fontWeight: FontWeight.bold,),),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(left: 4.0, right: 4.0, bottom: 4.0),
                      child: new Text(article.description,
                        maxLines: 4,
                        overflow: TextOverflow.clip,
                        style: new TextStyle(fontSize: 13, color: Colors.grey[500],),),
                    ),
                  ],
                ),
              ),
              new Column(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(top: 0.0),
                    child: NewsListItemImage(tag, article.photo),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );

    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
      margin: EdgeInsets.only(top: 10.0, left: 2.0, right: 2.0),
      child: Material(
        child: InkWell(
          onTap: onTapped,
          child: Container(
            child: new Stack(
              children: <Widget>[
                articleCard
              ],
            ),
          ),
        ),
      ),
    );

  }

}