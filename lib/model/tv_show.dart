import 'package:equatable/equatable.dart';

import 'package:all_things_eswatini/model/tv_channel.dart';

class TvShow extends Equatable {
  final int id;
  final String title;
  final String description;
  final String starts;
  final String ends;
  final String rating;
  final String image;
  final String url;
  final TvChannel channel;

  TvShow({
    this.id,
    this.title,
    this.description,
    this.starts,
    this.ends,
    this.rating,
    this.image,
    this.url,
    this.channel,
  }) : super([
    id,
    title,
    description,
    starts,
    ends,
    rating,
    image,
    url,
    channel,
  ]);

  static TvShow fromJson(dynamic json) {
    return TvShow(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      starts: json['starts'] as String,
      ends: json['ends'] as String,
      rating: json['rating'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
      channel: _mapJsonObjectToTvChannel(json['channel']),
    );
  }

  static TvChannel _mapJsonObjectToTvChannel(dynamic json){
    int id = json['id'] as int;
    String name = json['name'] as String;
    String description = json['description'] as String;
    String photo = json['photo'] as String;

    return new TvChannel(id: id, name: name, description: description, photo: photo);
  }

}