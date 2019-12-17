import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:all_things_eswatini/redux/state.dart';
import 'package:all_things_eswatini/redux/reducers.dart';
import 'package:all_things_eswatini/util/navigation_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(appReducer, initialState: AppState.initial());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'All Things Eswatini',
        theme: _appTheme,
        routes: getRoutes(context, store),
        initialRoute: '/',
      ),
    );
  }
}

final ThemeData _appTheme = _buildTheme();

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
    headline: base.headline.copyWith(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      letterSpacing: -1.0,
    ),
    title: base.title.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w900,
      fontSize: 16.0,
      // letterSpacing: -1.0,
    ),
  ).apply(
    fontFamily: 'Poppins',
  );
}