import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:all_things_eswatini/ui/screens/weather/weather_current_location.dart';
import 'package:all_things_eswatini/ui/screens/weather/weather_list_item.dart';
import 'package:all_things_eswatini/ui/screens/weather/station/station_page.dart';
import 'package:all_things_eswatini/model/loading_status.dart';
import 'package:all_things_eswatini/model/weather.dart';
import 'package:all_things_eswatini/redux/state.dart';
import 'package:all_things_eswatini/util/navigation_utils.dart';

class WeatherList extends StatelessWidget {

  WeatherList({Key key}) : super(key: key);

  void _viewStation(BuildContext context, Weather station) {
    //materialNavigateTo(context, StationPage(station: station));
  }

  _buildCurrentLocationWeather(BuildContext context, Weather report) => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WeatherCurrentLocation(report: report),
        ),
      ],
    ),
  );

  _buildTownsWeather(BuildContext context, List<Weather> reports) => Container(
    alignment: Alignment.bottomLeft,
    child: Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: 180.0,
        child: new ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, i) => new WeatherListItem(report: reports[i], onTapped: () => _viewStation(context, reports[i]),),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        List<Weather> reports = vm.reports;

        if (reports.length == 0) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
            child: Center(child: Text('Weather unavailable...', style: Theme.of(context).textTheme.subtitle,)),
          );
        }

        return Container(
          height: MediaQuery.of(context).size.height - 100,
          margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 10.0,),
              _buildCurrentLocationWeather(context, reports[0]),
              _buildTownsWeather(context, reports),
            ],
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final LoadingStatus status;
  final List<Weather> reports;

  _ViewModel({
    this.status,
    this.reports,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      status: store.state.weatherStatus,
      reports: store.state.weather,
    );
  }
}