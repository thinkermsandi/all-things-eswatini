import 'package:flutter/material.dart';

import 'package:all_things_eswatini/ui/widgets/app_bar_white.dart';
import 'package:all_things_eswatini/model/news_article.dart';

class NewsArticleHeader extends StatelessWidget {
  final NewsArticle article;

  NewsArticleHeader({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(article.title, style: titleStyle,),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(article.organization.name, style: infoDetailsStyle,),
                    Text(article.created.toIso8601String(), style: infoExtraDetailsStyle,),
                  ],
                )
            ),
          ],
        ),
      ],
    );

    return Stack(
      children: <Widget>[
        ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.3,
            minWidth: MediaQuery.of(context).size.width,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
            child: Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0, bottom: 12.0),
                child: Column(
                  children: <Widget>[
                    AppBarWhite(leftIcon: Icons.arrow_back,),
                    SizedBox(height: 50.0,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        topContentText,
                      ],
                    ),
                  ],
                )
            ),
          ),
        ),
      ],
    );
  }

  static const TextStyle titleStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 28.0
  );

  static const TextStyle infoDetailsStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 14.0
  );

  static const TextStyle infoExtraDetailsStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0
  );

}