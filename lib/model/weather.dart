import 'package:equatable/equatable.dart';

import 'package:all_things_eswatini/model/weather_condition.dart';
import 'package:all_things_eswatini/model/weather_station.dart';
import 'package:all_things_eswatini/config/constants.dart';

class Weather extends Equatable {
  final int id;
  final WeatherStation station;
  final WeatherCondition condition;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final DateTime created;
  final DateTime lastUpdated;

  Weather({
    this.id,
    this.station,
    this.condition,
    this.minTemp,
    this.maxTemp,
    this.temp,
    this.created,
    this.lastUpdated,
  }) : super([
    id,
    station,
    condition,
    minTemp,
    maxTemp,
    temp,
    created,
    lastUpdated,
  ]);

  static Weather fromJson(dynamic json) {
    return Weather(
      id: json['id'] as int,
      station: _mapJsonObjectToWeatherStation(json['station']),
      condition: _mapStringToWeatherCondition(json['condition']),
      minTemp: json['min_temp'] as double,
      maxTemp: json['max_temp'] as double,
      temp: json['temp'] as double,
      created: _mapTimestampToDateTime(json['timestamp']),
      lastUpdated: DateTime.now(),
    );
  }

  static WeatherStation _mapJsonObjectToWeatherStation(dynamic json){
    int id = json['id'] as int;
    String name = json['name'] as String;
    double latitude = json['latitude'] as double;
    double longitude = json['longitude'] as double;

    return new WeatherStation(id: id, name: name, latitude: latitude, longitude: longitude);
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

  static String mapWeatherConditionToString(WeatherCondition condition) {
    String state;
    switch (condition) {
      case WeatherCondition.snow:
        state = "snow";
        break;
      case WeatherCondition.sleet:
        state = "sleet";
        break;
      case WeatherCondition.hail:
        state = "hail";
        break;
      case WeatherCondition.thunderstorm:
        state = "thunderstorm";
        break;
      case WeatherCondition.heavyRain:
        state = "heavy rain";
        break;
      case WeatherCondition.lightRain:
        state = "light rain";
        break;
      case WeatherCondition.showers:
        state = "showers";
        break;
      case WeatherCondition.heavyCloud:
        state = "heavy cloud";
        break;
      case WeatherCondition.lightCloud:
        state = "light cloud";
        break;
      case WeatherCondition.clear:
        state = "clear";
        break;
      default:
        state = "unknown";
    }

    return state;
  }

  static String mapWeatherConditionToWeatherAsset(WeatherCondition condition) {
    String asset;

    switch (condition) {
      case WeatherCondition.snow:
        asset = Constants.iconSnow;
        break;
      case WeatherCondition.sleet:
        asset = Constants.iconDust;
        break;
      case WeatherCondition.hail:
        asset = Constants.iconThunder;
        break;
      case WeatherCondition.thunderstorm:
        asset = Constants.iconThunder;
        break;
      case WeatherCondition.heavyRain:
        asset = Constants.iconRain;
        break;
      case WeatherCondition.lightRain:
        asset = Constants.iconCloudLittleRain;
        break;
      case WeatherCondition.showers:
        asset = Constants.iconRain;
        break;
      case WeatherCondition.heavyCloud:
        asset = Constants.iconCloud;
        break;
      case WeatherCondition.lightCloud:
        asset = Constants.iconCloudSun;
        break;
      case WeatherCondition.clear:
        asset = Constants.iconSun;
        break;
      default:
        asset = "";
    }

    return asset;
  }

  static DateTime _mapTimestampToDateTime(int timestamp){
    return new DateTime.fromMillisecondsSinceEpoch(timestamp);
  }
  
}