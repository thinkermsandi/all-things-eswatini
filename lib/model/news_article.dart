import 'package:equatable/equatable.dart';

import 'package:all_things_eswatini/model/news_category.dart';
import 'package:all_things_eswatini/model/news_organization.dart';

class NewsArticle extends Equatable {
  final int id;
  final String title;
  final String description;
  final NewsCategory category;
  final NewsOrganization organization;
  final String photo;
  final DateTime created;

  NewsArticle({
    this.id,
    this.title,
    this.description,
    this.category,
    this.organization,
    this.photo,
    this.created,
  }) : super([
    id,
    title,
    description,
    category,
    organization,
    photo,
    created,
  ]);

  static NewsArticle fromJson(dynamic json) {
    return NewsArticle(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: _mapJsonObjectToNewsCategory(json['category']),
      organization: _mapJsonObjectToNewsOrganization(json['organization']),
      photo: json['photo'] as String,
      created: _mapTimestampToDateTime(json['timestamp']),
    );
  }

  static NewsCategory _mapJsonObjectToNewsCategory(dynamic json){
    int id = json['id'] as int;
    String name = json['name'] as String;
    String photo = json['photo'] as String;

    return new NewsCategory(id: id, name: name, photo: photo);
  }

  static NewsOrganization _mapJsonObjectToNewsOrganization(dynamic json){
    int id = json['id'] as int;
    String name = json['name'] as String;
    String description = json['description'] as String;
    String photo = json['photo'] as String;

    return new NewsOrganization(id: id, name: name, description: description, photo: photo);
  }

  static DateTime _mapTimestampToDateTime(int timestamp){
    return new DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

}