// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SocialLink {
  final String id;
  final String name;
  final Map data;
  final String type;

  SocialLink({
    required this.id,
    required this.name,
    required this.data,
    required this.type,
  });


  SocialLink copyWith({
    String? id,
    String? name,
    Map? data,
    String? type,
  }) {
    return SocialLink(
      id: id ?? this.id,
      name: name ?? this.name,
      data: data ?? this.data,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'data': data,
      'type': type,
    };
  }

  factory SocialLink.fromMap(Map<String, dynamic> map) {
    return SocialLink(
      id: map['id'] as String,
      name: map['name'] as String,
      data: Map.from((map['data'] as Map)),
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialLink.fromJson(String source) => SocialLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SocialLink(id: $id, name: $name, data: $data, type: $type)';
  }

  @override
  bool operator ==(covariant SocialLink other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      mapEquals(other.data, data) &&
      other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      data.hashCode ^
      type.hashCode;
  }
}
