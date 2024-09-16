// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
part 'search_model.g.dart';

@HiveType(typeId: 5)
class SearchModel extends HiveObject {
  @HiveField(0)
  final String querry;

  @HiveField(1)
  final String type;

  @HiveField(2)
  final String date;

  SearchModel({
    required this.querry,
    required this.type,
    required this.date,
  });

  SearchModel copyWith({String? querry, String? type, String? date}) {
    return SearchModel(
        querry: querry ?? this.querry,
        type: type ?? this.type,
        date: date ?? this.date);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'querry': querry, 'type': type, "date": date};
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
        querry: map['querry'] as String,
        type: map['type'] as String,
        date: map["date"] as String);
  }

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SearchModel(querry: $querry, type: $type, date: $date)';

  @override
  bool operator ==(covariant SearchModel other) {
    if (identical(this, other)) return true;

    return other.querry == querry && other.type == type && other.date == date;
  }

  @override
  int get hashCode => querry.hashCode ^ type.hashCode ^ date.hashCode;
}
