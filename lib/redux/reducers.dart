
import 'package:all_things_eswatini/model/job.dart';
import 'package:all_things_eswatini/model/mobile_app.dart';
import 'package:all_things_eswatini/model/news_article.dart';
import 'package:all_things_eswatini/model/tv_show.dart';
import 'package:all_things_eswatini/model/weather.dart';
import 'package:all_things_eswatini/redux/action.dart';
import 'package:all_things_eswatini/redux/state.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    jobs: jobsReducer(state.jobs, action),
    mobileApps: mobileAppsReducer(state.mobileApps, action),
    news: newsReducer(state.news, action),
    tvShows: tvShowsReducer(state.tvShows, action),
    weather: weatherReducer(state.weather, action),
  );
}

List<Job> jobsReducer(List<Job> state, dynamic action) {
  if (action is FetchJobsAction) {
    return _fetchJobs(state, action);
  }

  return state;
}

List<MobileApp> mobileAppsReducer(List<MobileApp> state, dynamic action) {
  if (action is FetchMobileAppsAction) {
    return _fetchMobileApps(state, action);
  }

  return state;
}

List<NewsArticle> newsReducer(List<NewsArticle> state, dynamic action) {
  if (action is FetchNewsAction) {
    return _fetchNews(state, action);
  }

  return state;
}

List<TvShow> tvShowsReducer(List<TvShow> state, dynamic action) {
  if (action is FetchTvShowsAction) {
    return _fetchTvShows(state, action);
  }

  return state;
}

List<Weather> weatherReducer(List<Weather> state, dynamic action) {
  if (action is FetchWeatherAction) {
    return _fetchWeather(state, action);
  }

  return state;
}

List<Job> _fetchJobs(List<Job> state, FetchJobsAction action) {
  return action.jobs;
}

List<MobileApp> _fetchMobileApps(List<MobileApp> state, FetchMobileAppsAction action) {
  return action.apps;
}

List<NewsArticle> _fetchNews(List<NewsArticle> state, FetchNewsAction action) {
  return action.news;
}

List<TvShow> _fetchTvShows(List<TvShow> state, FetchTvShowsAction action) {
  return action.shows;
}

List<Weather> _fetchWeather(List<Weather> state, FetchWeatherAction action) {
  return action.weather;
}