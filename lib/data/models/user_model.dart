// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 6)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String pic;
  UserModel({
    required this.name,
    required this.pic,
  });

  UserModel copyWith({
    String? name,
    String? pic,
  }) {
    return UserModel(
      name: name ?? this.name,
      pic: pic ?? this.pic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'pic': pic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      pic: map['pic'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, pic: $pic)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.pic == pic;
  }

  @override
  int get hashCode => name.hashCode ^ pic.hashCode;
}
