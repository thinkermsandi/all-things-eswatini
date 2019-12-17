import 'package:equatable/equatable.dart';

class NewsCategory extends Equatable {
  final int id;
  final String name;
  final String photo;

  NewsCategory({
    this.id,
    this.name,
    this.photo,
  }) : super([
    id,
    name,
    photo,
  ]);

  static NewsCategory fromJson(dynamic json) {
    return NewsCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String,
    );
  }

}