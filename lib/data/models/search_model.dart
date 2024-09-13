// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 5)
class SearchModel extends HiveObject {
  final String querry;
  final String type;

  SearchModel({
    required this.querry,
    required this.type,
  });

  SearchModel copyWith({
    String? querry,
    String? type,
  }) {
    return SearchModel(
      querry: querry ?? this.querry,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'querry': querry,
      'type': type,
    };
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      querry: map['querry'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SearchModel(querry: $querry, type: $type)';

  @override
  bool operator ==(covariant SearchModel other) {
    if (identical(this, other)) return true;

    return other.querry == querry && other.type == type;
  }

  @override
  int get hashCode => querry.hashCode ^ type.hashCode;
}
