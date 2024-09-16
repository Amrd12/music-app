// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArtistModelAdapter extends TypeAdapter<ArtistModel> {
  @override
  final int typeId = 3;

  @override
  ArtistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArtistModel(
      channelId: fields[0] as String,
      title: fields[1] as String,
      thumbnail: fields[2] as String,
      subscriberText: fields[3] as String,
      description: fields[4] as String,
      songs: (fields[5] as List).cast<MusicModel>(),
      albums: (fields[6] as List).cast<AlbumModel>(),
      singles: (fields[7] as List).cast<AlbumModel>(),
      musics: (fields[8] as List).cast<MusicModel>(),
      playlist: (fields[9] as List).cast<AlbumModel>(),
      artist: (fields[10] as List).cast<ArtistModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ArtistModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.channelId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.thumbnail)
      ..writeByte(3)
      ..write(obj.subscriberText)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.songs)
      ..writeByte(6)
      ..write(obj.albums)
      ..writeByte(7)
      ..write(obj.singles)
      ..writeByte(8)
      ..write(obj.musics)
      ..writeByte(9)
      ..write(obj.playlist)
      ..writeByte(10)
      ..write(obj.artist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArtistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
