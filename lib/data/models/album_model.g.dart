// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumModelAdapter extends TypeAdapter<AlbumModel> {
  @override
  final int typeId = 4;

  @override
  AlbumModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumModel(
      id: fields[0] as String,
      title: fields[1] as String,
      thumbnail: fields[2] as String,
      albumDescription: fields[3] as String,
      albumAuthor: fields[4] as String?,
      albumTotalSong: fields[5] as String?,
      albumTotalDuration: fields[6] as String?,
      musics: (fields[7] as List?)?.cast<MusicModel>(),
      albumRelease: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AlbumModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.thumbnail)
      ..writeByte(3)
      ..write(obj.albumDescription)
      ..writeByte(4)
      ..write(obj.albumAuthor)
      ..writeByte(5)
      ..write(obj.albumTotalSong)
      ..writeByte(6)
      ..write(obj.albumTotalDuration)
      ..writeByte(7)
      ..write(obj.musics)
      ..writeByte(8)
      ..write(obj.albumRelease);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
