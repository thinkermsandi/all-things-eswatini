import 'package:equatable/equatable.dart';

class MobileAppCategory extends Equatable {
  final int id;
  final String name;
  final String photo;

  MobileAppCategory({
    this.id,
    this.name,
    this.photo,
  }) : super([
    id,
    name,
    photo,
  ]);

  static MobileAppCategory fromJson(dynamic json) {
    return MobileAppCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String,
    );
  }

}