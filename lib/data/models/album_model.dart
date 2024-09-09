import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:musicapp/data/models/music_model.dart';

@HiveType(typeId: 4)
class AlbumModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String thumbnail;
  @HiveField(3)
  String albumDescription;
  @HiveField(4)
  String? albumAuthor;
  @HiveField(5)
  String? albumTotalSong;
  @HiveField(6)
  String? albumTotalDuration;
  @HiveField(7)
  List<MusicModel>? musics;
  @HiveField(8)
  String? albumRelease;

  AlbumModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.albumDescription,
    this.albumAuthor,
    this.albumTotalSong,
    this.albumTotalDuration,
    this.musics,
    this.albumRelease,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'browseId': id,
      'title': title,
      'thumbnail': thumbnail,
      'subtitle': albumDescription,
      'albumAuthor': albumAuthor,
      'albumTotalSong': albumTotalSong,
      'albumTotalDuration': albumTotalDuration,
      'results': musics?.map((x) => x.toMap()).toList(),
      'albumRelease': albumRelease,
    };
  }

  factory AlbumModel.fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      id: map['browseId'] as String,
      title: map['title'] as String,
      thumbnail: map['thumbnail'] as String,
      albumDescription: map['subtitle'] as String,
      albumAuthor:
          map['albumAuthor'] != null ? map['albumAuthor'] as String : null,
      albumTotalSong: map['albumTotalSong'] != null
          ? map['albumTotalSong'] as String
          : null,
      albumTotalDuration: map['albumTotalDuration'] != null
          ? map['albumTotalDuration'] as String
          : null,
      musics: map['results'] != null
          ? List<MusicModel>.from(
              (map['results'] as List<int>).map<MusicModel?>(
                (x) => MusicModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      albumRelease:
          map['albumRelease'] != null ? map['albumRelease'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumModel.fromJson(String source) =>
      AlbumModel.fromMap(json.decode(source) as Map<String, dynamic>);

  AlbumModel copyWith({
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
    return AlbumModel(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      albumDescription: subtitle ?? albumDescription,
      albumAuthor: playlistAuthor ?? albumAuthor,
      albumTotalSong: playlistTotalSong ?? albumTotalSong,
      albumTotalDuration: playlistTotalDuration ?? albumTotalDuration,
      musics: musics ?? this.musics,
      albumRelease: playlistRelease ?? albumRelease,
    );
  }
}
