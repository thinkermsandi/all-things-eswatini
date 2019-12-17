import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:all_things_eswatini/ui/screens/apps/apps_page.dart';
import 'package:all_things_eswatini/ui/screens/home/home_page.dart';
import 'package:all_things_eswatini/ui/screens/jobs/jobs_page.dart';
import 'package:all_things_eswatini/ui/screens/news/news_page.dart';
import 'package:all_things_eswatini/ui/screens/tv/tv_page.dart';
import 'package:all_things_eswatini/ui/screens/weather/weather_page.dart';

import 'package:all_things_eswatini/redux/state.dart';

Map<String, WidgetBuilder> getRoutes(context, store) {
  return {
    '/': (BuildContext context) => new StoreBuilder<AppState>(
      builder: (context, store) {
        return new HomePage();
      },
    ),
    '/weather': (BuildContext context) => new StoreBuilder<AppState>(
      builder: (context, store) {
        return new WeatherPage();
      },
    ),
    '/news': (BuildContext context) => new StoreBuilder<AppState>(
      builder: (context, store) {
        return new NewsPage();
      },
    ),
    '/tv': (BuildContext context) => new StoreBuilder<AppState>(
      builder: (context, store) {
        return new TvPage();
      },
    ),
    '/apps': (BuildContext context) => new StoreBuilder<AppState>(
      builder: (context, store) {
        return new AppsPage();
      },
    ),
    '/jobs': (BuildContext context) => new StoreBuilder<AppState>(
      builder: (context, store) {
        return new JobsPage();
      },
    ),
  };
}

Widget findRoute(String routeName){
  Widget route = Container(); //TODO: Initialize this to page not found route

  switch(routeName){
    case '/':
      route = JobsPage();
      break;
    case '/weather':
      route = WeatherPage();
      break;
    case '/news':
      route = NewsPage();
      break;
    case '/tv':
      route = TvPage();
      break;
    case '/apps':
      route = AppsPage();
      break;
    case '/jobs':
      route = JobsPage();
      break;
  }

  return route;
}

void navigateTo(BuildContext context, Widget widget, {String path: '', bool replace: false}) {
  final builder = new PageRouteBuilder(
    settings: path.isNotEmpty ? new RouteSettings(name: path) : null,
    pageBuilder: (_, __, ___) {
      return widget;
    },
  );

  if (replace) {
    Navigator.of(context).pushReplacement(builder);
  }
  else {
    Navigator.of(context).push(builder);
  }
}

void materialNavigateTo(BuildContext context, Widget widget, {String path: '', bool replace: false}) {
  final route = new MaterialPageRoute(
    settings: path.isNotEmpty ? new RouteSettings(name: path) : null,
    builder: (BuildContext context) => widget,
  );

  if (replace) {
    Navigator.pushReplacement(context, route);
  }
  else {
    Navigator.push(context, route);
  }
}