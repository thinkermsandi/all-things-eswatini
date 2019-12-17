import 'package:equatable/equatable.dart';

class WeatherStation extends Equatable {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  WeatherStation({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
  }) : super([
    id,
    name,
    latitude,
    longitude,
  ]);

  static WeatherStation fromJson(dynamic json) {
    return WeatherStation(
      id: json['id'] as int,
      name: json['name'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

}