// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:musicapp/data/models/music_model.dart';
part 'playlist_model.g.dart';

@HiveType(typeId: 2)
class PlaylistModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String thumbnail;
  @HiveField(3)
  String? subtitle;
  @HiveField(4)
  String? playlistAuthor;
  @HiveField(5)
  String? playlistTotalSong;
  @HiveField(6)
  String? playlistTotalDuration;
  @HiveField(7)
  List<MusicModel>? musics;
  @HiveField(8)
  String? playlistRelease;

  PlaylistModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    this.subtitle,
    this.playlistAuthor,
    this.playlistTotalSong,
    this.playlistTotalDuration,
    this.musics,
    this.playlistRelease,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'subtitle': subtitle,
      'playlistAuthor': playlistAuthor,
      'playlistTotalSong': playlistTotalSong,
      'playlistTotalDuration': playlistTotalDuration,
      'Musics': musics?.map((x) => x.toMap()).toList(),
      'playlistRelease': playlistRelease,
    };
  }

  factory PlaylistModel.fromMap(Map<String, dynamic> map) {
    if (map.containsKey("playlistId")) {
      map["id"] = map["playlistId"];
      map.remove("playlistId");
    }
    if (map.containsKey("author")) {
      map["playlistAuthor"] = map["author"];
      map.remove("author");
    }
    return PlaylistModel(
      id: map['id'] as String,
      title: map['title'] as String,
      thumbnail: map['thumbnail'] as String,
      subtitle: map['subtitle'] != null ? map['subtitle'] as String : null,
      playlistAuthor: map['playlistAuthor'] != null
          ? map['playlistAuthor'] as String
          : null,
      playlistTotalSong: map['playlistTotalSong'] != null
          ? map['playlistTotalSong'] as String
          : null,
      playlistTotalDuration: map['playlistTotalDuration'] != null
          ? map['playlistTotalDuration'] as String
          : null,
      musics: map['Musics'] != null
          ? List<MusicModel>.from(
              (map['Musics'] as List<int>).map<MusicModel?>(
                (x) => MusicModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      playlistRelease: map['playlistRelease'] != null
          ? map['playlistRelease'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaylistModel.fromJson(String source) =>
      PlaylistModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PlaylistModel copyWith({
    String? id,
    String? title,
    String? thumbnail,
    String? subtitle,
    String? playlistAuthor,
    String? playlistTotalSong,
    String? playlistTotalDuration,
    List<MusicModel>? musics,
    String? playlistRelease,
  }) {
    return PlaylistModel(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      subtitle: subtitle ?? this.subtitle,
      playlistAuthor: playlistAuthor ?? this.playlistAuthor,
      playlistTotalSong: playlistTotalSong ?? this.playlistTotalSong,
      playlistTotalDuration:
          playlistTotalDuration ?? this.playlistTotalDuration,
      musics: musics ?? this.musics,
      playlistRelease: playlistRelease ?? this.playlistRelease,
    );
  }
}
