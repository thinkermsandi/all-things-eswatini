import 'package:equatable/equatable.dart';

import 'package:all_things_eswatini/model/weather_condition.dart';

class WeatherForecast extends Equatable {
  final int id;
  final WeatherCondition condition;
  final double minTemp;
  final double maxTemp;
  final DateTime date;

  WeatherForecast({
    this.id,
    this.condition,
    this.minTemp,
    this.maxTemp,
    this.date,
  }) : super([
    id,
    condition,
    minTemp,
    maxTemp,
    date
  ]);

  static WeatherForecast fromJson(dynamic json) {
    return WeatherForecast(
      id: json['id'] as int,
      condition: _mapStringToWeatherCondition(json['condition']),
      minTemp: json['min_temp'] as double,
      maxTemp: json['max_temp'] as double,
      date: _mapTimestampToDateTime(json['date']),
    );
  }

  static WeatherCondition _mapStringToWeatherCondition(String input) {
    WeatherCondition state;
    switch (input) {
      case 'sn':
        state = WeatherCondition.snow;
        break;
      case 'sl':
        state = WeatherCondition.sleet;
        break;
      case 'h':
        state = WeatherCondition.hail;
        break;
      case 't':
        state = WeatherCondition.thunderstorm;
        break;
      case 'hr':
        state = WeatherCondition.heavyRain;
        break;
      case 'lr':
        state = WeatherCondition.lightRain;
        break;
      case 's':
        state = WeatherCondition.showers;
        break;
      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }

  static DateTime _mapTimestampToDateTime(int timestamp){
    return new DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

}