import 'package:equatable/equatable.dart';

class MobileAppSection extends Equatable {
  final String key;
  final String title;

  MobileAppSection({
    this.key,
    this.title,
  }) : super([
    key,
    title,
  ]);

  static MobileAppSection fromJson(dynamic json) {
    return MobileAppSection(
      key: json['key'] as String,
      title: json['title'] as String,
    );
  }

}