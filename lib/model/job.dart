import 'package:equatable/equatable.dart';

import 'package:all_things_eswatini/model/job_employer.dart';

class Job extends Equatable {
  final int id;
  final String name;
  final String description;
  final String location;
  final JobEmployer employer;
  final DateTime expires;

  Job({
    this.id,
    this.name,
    this.description,
    this.location,
    this.employer,
    this.expires,
  }) : super([
    id,
    name,
    description,
    location,
    employer,
    expires,
  ]);

  static Job fromJson(dynamic json) {
    return Job(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      employer: _mapJsonObjectToJobEmployer(json['employer']),
      expires: _mapTimestampToDateTime(json['expires']),
    );
  }

  static JobEmployer _mapJsonObjectToJobEmployer(dynamic json){
    int id = json['id'] as int;
    String name = json['name'] as String;
    String description = json['description'] as String;
    String email = json['email'] as String;
    String website = json['website'] as String;
    String photo = json['photo'] as String;

    return new JobEmployer(id: id, name: name, description: description, email: email, website: website, photo: photo);
  }

  static DateTime _mapTimestampToDateTime(int timestamp){
    return new DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

}