import 'package:meta/meta.dart';

import 'package:all_things_eswatini/model/job.dart';
import 'package:all_things_eswatini/model/mobile_app.dart';
import 'package:all_things_eswatini/model/news_article.dart';
import 'package:all_things_eswatini/model/tabs_news.dart';
import 'package:all_things_eswatini/model/tabs_tv.dart';
import 'package:all_things_eswatini/model/tv_show.dart';
import 'package:all_things_eswatini/model/weather.dart';

abstract class AppAction {
  AppAction();

  String toString() => '$runtimeType';
}

class SetNewsTabAction extends AppAction {
  final NewsTab currentTab;

  SetNewsTabAction(this.currentTab);
}

class SetTvTabAction extends AppAction {
  final TvTab currentTab;

  SetTvTabAction(this.currentTab);
}

class FetchJobsAction extends AppAction {
  final List<Job> jobs;

  FetchJobsAction({@required this.jobs});
}

class FetchMobileAppsAction extends AppAction {
  final List<MobileApp> apps;

  FetchMobileAppsAction({@required this.apps});
}

class FetchNewsAction extends AppAction {
  final List<NewsArticle> news;

  FetchNewsAction({@required this.news});
}

class FetchTvShowsAction extends AppAction {
  final List<TvShow> shows;

  FetchTvShowsAction({@required this.shows});
}

class FetchWeatherAction extends AppAction {
  final List<Weather> weather;

  FetchWeatherAction({@required this.weather});
}