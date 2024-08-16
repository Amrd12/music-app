// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class LyricsModel extends HiveObject {
  @HiveField(0)
  bool isPlain;
  @HiveField(1)
  String? plainText;
  @HiveField(2)
  List<Map<String, dynamic>>? text; // Change type to Map<String, dynamic>

  LyricsModel.LyricModel({
    required this.isPlain,
    this.plainText,
    this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isPlain': isPlain,
      'plainText': plainText,
      'Text': text,
    };
  }

  factory LyricsModel.fromMap(Map<String, dynamic> map) {
    return LyricsModel.LyricModel(
      isPlain: map['isPlain'] as bool,
      plainText: map['plainText'] as String?,
      text: map['Text'] != null
          ? List<Map<String, dynamic>>.from(
              (map['Text'] as List).map<Map<String, dynamic>>(
                (x) => x as Map<String, dynamic>,
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LyricsModel.fromJson(String source) =>
      LyricsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
