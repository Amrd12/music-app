// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LyricsModelAdapter extends TypeAdapter<LyricsModel> {
  @override
  final int typeId = 1;

  @override
  LyricsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LyricsModel(
      isPlain: fields[0] as bool,
      plainText: fields[1] as String?,
      text: (fields[2] as List?)
          ?.map((dynamic e) => (e as Map).cast<String, dynamic>())
          ?.toList(),
    );
  }

  @override
  void write(BinaryWriter writer, LyricsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isPlain)
      ..writeByte(1)
      ..write(obj.plainText)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LyricsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
