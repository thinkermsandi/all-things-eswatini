import 'package:equatable/equatable.dart';

import 'package:all_things_eswatini/model/mobile_app_category.dart';
import 'package:all_things_eswatini/model/mobile_app_developer.dart';
import 'package:all_things_eswatini/model/mobile_app_permission.dart';

class MobileApp extends Equatable {
  final int id;
  final String name;
  final String description;
  final MobileAppCategory category;
  final String version;
  final int size;
  final int installs;
  final String minimumAndroidVersion;
  final List<MobileAppPermission> permissions;
  final MobileAppDeveloper developer;
  final String photo;
  final DateTime updated;

  MobileApp({
    this.id,
    this.name,
    this.description,
    this.category,
    this.version,
    this.size,
    this.installs,
    this.minimumAndroidVersion,
    this.permissions,
    this.developer,
    this.photo,
    this.updated,
  }) : super([
    id,
    name,
    description,
    category,
    version,
    size,
    installs,
    minimumAndroidVersion,
    permissions,
    developer,
    photo,
    updated,
  ]);

  static MobileApp fromJson(dynamic json) {
    return MobileApp(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      category: _mapJsonObjectToMobileAppCategory(json['category']),
      version: json['version'] as String,
      size: json['size'] as int,
      installs: json['installs'] as int,
      minimumAndroidVersion: json['minimum_android_version'] as String,
      permissions: _mapJsonArrayToMobileAppPermissions(json['permissions']),
      developer: _mapJsonObjectToMobileAppDeveloper(json['developer']),
      photo: json['photo'] as String,
      updated: _mapTimestampToDateTime(json['updated']),
    );
  }

  static MobileAppCategory _mapJsonObjectToMobileAppCategory(dynamic json){
    int id = json['id'] as int;
    String name = json['name'] as String;
    String photo = json['photo'] as String;

    return new MobileAppCategory(id: id, name: name, photo: photo);
  }

  static MobileAppDeveloper _mapJsonObjectToMobileAppDeveloper(dynamic json){
    int id = json['id'] as int;
    String name = json['name'] as String;
    String description = json['description'] as String;
    String email = json['email'] as String;
    String website = json['website'] as String;
    String photo = json['photo'] as String;

    return new MobileAppDeveloper(id: id, name: name, description: description, email: email, website: website, photo: photo);
  }

  static List<MobileAppPermission> _mapJsonArrayToMobileAppPermissions(dynamic json){
    List<MobileAppPermission> permissions = new List();

    for (var permission in json) {
      String name = permission['name'] as String;
      String description = permission['description'] as String;

      permissions.add(new MobileAppPermission(name: name, description: description));
    }

    return permissions;
  }

  static DateTime _mapTimestampToDateTime(int timestamp){
    return new DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

}