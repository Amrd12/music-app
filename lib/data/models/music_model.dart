// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_init_to_null
import 'dart:convert';

import 'package:hive/hive.dart';

// part 'info_music_model.g.dart';

@HiveType(typeId: 0)
class MusicModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final List<String> thumbnail;

  @HiveField(4)
  bool isDetailed = false;

  @HiveField(5)
  final String? channelId;

  @HiveField(6)
  int startFrom = 0;

  @HiveField(7)
  final int? seceunds;

  List<Map<String, String>>? formates;

  MusicModel({
    required this.id,
    required this.title,
    required this.author,
    required this.thumbnail,
    this.formates,
    this.channelId = null,
    this.seceunds = null,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'author': author,
      'thumbnail': thumbnail,
      'channelId': channelId,
      'seceunds': seceunds,
      'isDetailed': isDetailed,
      "formates": formates
    };
  }

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    if (map['thumbnail'].runtimeType == String) {
      map['thumbnail'] = [map['thumbnail'].toString()];
    }
    return MusicModel(
      id: map['videoId'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      thumbnail: List<String>.from((map['thumbnail'] as List<String>)),
      channelId: map['channelId'] != null ? map['channelId'] as String : null,
      seceunds: map['seceunds'] != null ? map['seceunds'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicModel.fromJson(String source) =>
      MusicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MusicModel copyWith(
      {String? id,
      String? title,
      String? author,
      List<String>? thumbnail,
      String? channelId,
      int? startFrom,
      int? seceunds,
      bool? isDetailed,
      List<Map<String, String>>? formates}) {
    return MusicModel(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        thumbnail: thumbnail ?? this.thumbnail,
        channelId: channelId ?? this.channelId,
        seceunds: seceunds ?? this.seceunds,
        formates: formates ?? this.formates);
  }
}
