import 'package:equatable/equatable.dart';

class TvChannel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String photo;

  TvChannel({
    this.id,
    this.name,
    this.description,
    this.photo,
  }) : super([
    id,
    name,
    description,
    photo,
  ]);

  static TvChannel fromJson(dynamic json) {
    return TvChannel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      photo: json['photo'] as String,
    );
  }

}