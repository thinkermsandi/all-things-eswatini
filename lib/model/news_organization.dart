import 'package:equatable/equatable.dart';

class NewsOrganization extends Equatable {
  final int id;
  final String name;
  final String description;
  final String photo;

  NewsOrganization({
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

  static NewsOrganization fromJson(dynamic json) {
    return NewsOrganization(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      photo: json['photo'] as String,
    );
  }

}