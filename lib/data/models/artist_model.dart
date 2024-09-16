import 'package:hive/hive.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/data/models/music_model.dart';

@HiveType(typeId: 3)
class ArtistModel extends HiveObject {
  @HiveField(0)
  final String channelId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  String thumbnail;
  @HiveField(3)
  String subscriberText;
  @HiveField(4)
  String description;
  @HiveField(5)
  List<MusicModel> songs; // k
  @HiveField(6)
  List<AlbumModel> albums; //k
  @HiveField(7)
  List<AlbumModel> singles; // k
  @HiveField(8)
  List<MusicModel> musics; //k
  @HiveField(9)
  List<AlbumModel> playlist; //k
  @HiveField(10)
  List<ArtistModel> artist;

  // Constructor
  ArtistModel({
    required this.channelId,
    required this.title,
    required this.thumbnail,
    required this.subscriberText,
    this.description = '',
    this.songs = const [],
    this.albums = const [],
    this.singles = const [],
    this.musics = const [],
    this.playlist = const [],
    this.artist = const [],
  });

  // CopyWith method
  ArtistModel copyWith({
    String? channelId,
    String? title,
    String? thumbnail,
    String? subscriberText,
    String? description,
    List<MusicModel>? songs,
    List<AlbumModel>? albums,
    List<AlbumModel>? singles,
    List<MusicModel>? musics,
    List<AlbumModel>? playlist,
    List<ArtistModel>? artist,
  }) {
    return ArtistModel(
      channelId: channelId ?? this.channelId,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      subscriberText: subscriberText ?? this.subscriberText,
      description: description ?? this.description,
      songs: songs ?? this.songs,
      albums: albums ?? this.albums,
      singles: singles ?? this.singles,
      musics: musics ?? this.musics,
      playlist: playlist ?? this.playlist,
      artist: artist ?? this.artist,
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'channelId': channelId,
      'title': title,
      'thumbnail': thumbnail,
      'subscriberText': subscriberText,
      'description': description,
      'songs': songs.map((x) => x.toMap()).toList(),
      'albums': albums.map((x) => x.toMap()).toList(),
      'singles': singles.map((x) => x.toMap()).toList(),
      'musics': musics.map((x) => x.toMap()).toList(),
      'playlist': playlist.map((x) => x.toMap()).toList(),
      'artist': artist.map((x) => x.toMap()).toList(),
    };
  }

  // fromMap method
  factory ArtistModel.fromMap(Map<String, dynamic> map) {
    if (map.containsKey("browseId")) {
      map["channelId"] = map["browseId"];
      map.remove("browseId");
    }
    return ArtistModel(
      channelId: map['channelId'] ?? '',
      title: map['title'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      subscriberText: map['subscriberText'] ?? '',
      description: map['description'] ?? '',
      songs: (map['songs'] != null
          ? List<MusicModel>.from(
              map['songs'].map((x) => MusicModel.fromMap(x)))
          : []),
      albums: (map['albums'] != null
          ? List<AlbumModel>.from(
              map['albums'].map((x) => AlbumModel.fromMap(x)))
          : []),
      singles: (map['singles'] != null
          ? List<AlbumModel>.from(
              map['singles'].map((x) => AlbumModel.fromMap(x)))
          : []),
      musics: (map['musics'] != null
          ? List<MusicModel>.from(
              map['musics'].map((x) => MusicModel.fromMap(x)))
          : []),
      playlist: (map['playlist'] != null
          ? List<AlbumModel>.from(
              map['playlist'].map((x) => AlbumModel.fromMap(x)))
          : []),
      artist: (map['artist'] != null
          ? List<ArtistModel>.from(
              map['artist'].map((x) => ArtistModel.fromMap(x)))
          : []),
    );
  }
  // toJson method
  Map<String, dynamic> toJson() => toMap();

  // fromJson method
  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      ArtistModel.fromMap(json);
}
