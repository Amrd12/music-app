// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicModelAdapter extends TypeAdapter<MusicModel> {
  @override
  final int typeId = 0;

  @override
  MusicModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MusicModel(
      id: fields[0] as String,
      title: fields[1] as String,
      author: fields[2] as String,
      thumbnail: (fields[3] as List).cast<String>(),
      channelId: fields[5] as String?,
      seceunds: fields[7] as double?,
      lyrics: fields[8] as LyricsModel?,
    )
      ..isDetailed = fields[4] as bool
      ..startFrom = fields[6] as double;
  }

  @override
  void write(BinaryWriter writer, MusicModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.thumbnail)
      ..writeByte(4)
      ..write(obj.isDetailed)
      ..writeByte(5)
      ..write(obj.channelId)
      ..writeByte(6)
      ..write(obj.startFrom)
      ..writeByte(7)
      ..write(obj.seceunds)
      ..writeByte(8)
      ..write(obj.lyrics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
