import 'package:equatable/equatable.dart';

class JobEmployer extends Equatable {
  final int id;
  final String name;
  final String description;
  final String email;
  final String website;
  final String photo;

  JobEmployer({
    this.id,
    this.name,
    this.description,
    this.email,
    this.website,
    this.photo,
  }) : super([
    id,
    name,
    description,
    email,
    website,
    photo,
  ]);

  static JobEmployer fromJson(dynamic json) {
    return JobEmployer(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      email: json['email'] as String,
      website: json['website'] as String,
      photo: json['photo'] as String,
    );
  }

}