// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaylistModelAdapter extends TypeAdapter<PlaylistModel> {
  @override
  final int typeId = 2;

  @override
  PlaylistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaylistModel(
      id: fields[0] as String,
      title: fields[1] as String,
      thumbnail: fields[2] as String,
      subtitle: fields[3] as String?,
      playlistAuthor: fields[4] as String?,
      playlistTotalSong: fields[5] as String?,
      playlistTotalDuration: fields[6] as String?,
      musics: (fields[7] as List?)?.cast<MusicModel>(),
      playlistRelease: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PlaylistModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.thumbnail)
      ..writeByte(3)
      ..write(obj.subtitle)
      ..writeByte(4)
      ..write(obj.playlistAuthor)
      ..writeByte(5)
      ..write(obj.playlistTotalSong)
      ..writeByte(6)
      ..write(obj.playlistTotalDuration)
      ..writeByte(7)
      ..write(obj.musics)
      ..writeByte(8)
      ..write(obj.playlistRelease);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
