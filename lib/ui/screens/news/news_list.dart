import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:all_things_eswatini/ui/screens/news/news_list_item.dart';
import 'package:all_things_eswatini/ui/screens/news/article/news_article_page.dart';
import 'package:all_things_eswatini/model/loading_status.dart';
import 'package:all_things_eswatini/model/news_article.dart';
import 'package:all_things_eswatini/model/tabs_news.dart';
import 'package:all_things_eswatini/redux/state.dart';
import 'package:all_things_eswatini/util/navigation_utils.dart';

class NewsList extends StatelessWidget {

  NewsList({Key key}) : super(key: key);

  void _viewStory(BuildContext context, NewsArticle article) {
    materialNavigateTo(context, NewsArticlePage(article: article));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        List<NewsArticle> news = vm.news;

        if (news.length == 0) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
            child: Center(child: Text('No news articles yet...', style: Theme.of(context).textTheme.subtitle,)),
          );
        }

        return Container(
          margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
          child: Column(
            children: <Widget>[
              new ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: news.length,
                itemBuilder: (context, i) => new NewsListItem(article: news[i], onTapped: () => _viewStory(context, news[i]),),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final LoadingStatus status;
  final NewsTab currentTab;
  final List<NewsArticle> news;

  _ViewModel({
    this.status,
    this.currentTab,
    this.news,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      status: store.state.newsStatus,
      currentTab: store.state.newsCurrentTab,
      news: store.state.news,
    );
  }
}