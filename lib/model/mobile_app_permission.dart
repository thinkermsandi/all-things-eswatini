import 'package:equatable/equatable.dart';

class MobileAppPermission extends Equatable {
  final String name;
  final String description;

  MobileAppPermission({
    this.name,
    this.description
  }) : super([
    name,
    description
  ]);

  static MobileAppPermission fromJson(dynamic json) {
    return MobileAppPermission(
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

}