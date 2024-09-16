import 'package:musicapp/constans/icons_svg.dart';

enum ModelType {
  music,
  playlist,
  artist,
  album;

  @override
  String toString() {
    switch (this) {
      case ModelType.music:
        return "song";
      case ModelType.playlist:
        return "community_playlists";
      case ModelType.artist:
        return "artists";
      case ModelType.album:
        return "albums";
    }
  }

  String icon() {
    switch (this) {
      case ModelType.music:
        return IconsSvg.music;
      case ModelType.playlist:
        return IconsSvg.playlist;
      case ModelType.artist:
        return IconsSvg.author;
      case ModelType.album:
        return IconsSvg.album;
    }
  }
}

extension ToModelType on String {
  ModelType? toModelType() {
    switch (this) {
      case "song":
        return ModelType.music;
      case "community_playlists":
        return ModelType.playlist;
      case "artists":
        return ModelType.artist;
      case "albums":
        return ModelType.album;
      default:
        return null;
    }
  }
}
