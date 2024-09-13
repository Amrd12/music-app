import 'package:flutter/material.dart';

enum ModelType {
  music,
  playlist,
  author,
  album;

  @override
  String toString() {
    switch (this) {
      case ModelType.music:
        return "video";
      case ModelType.playlist:
        return "playlist";
      case ModelType.author:
        return "author";
      case ModelType.album:
        return "album";
    }
  }

  IconData icon() {
    switch (this) {
      case ModelType.music:
        return Icons.music_note;
      case ModelType.playlist:
        return Icons.playlist_add_rounded;
      case ModelType.author:
        return Icons.person;
      case ModelType.album:
        return Icons.album;
    }
  }
}

extension ToModelType on String {
  ModelType? toModelType() {
    switch (this) {
      case "music":
        return ModelType.music;
      case "playlist":
        return ModelType.playlist;
      case "author":
        return ModelType.author;
      case "album":
        return ModelType.album;
      default:
        return null;
    }
  }
}
