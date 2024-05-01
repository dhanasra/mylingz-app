// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SocialLink {
  final String id;
  final String name;
  final String icon;
  final Map data;
  final String type;

  SocialLink({
    required this.id,
    required this.name,
    required this.icon,
    required this.data,
    required this.type,
  });


  SocialLink copyWith({
    String? id,
    String? name,
    String? icon,
    Map? data,
    String? type,
  }) {
    return SocialLink(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      data: data ?? this.data,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'icon': icon,
      'data': data,
      'type': type,
    };
  }

  factory SocialLink.fromMap(Map<String, dynamic> map) {
    return SocialLink(
      id: map['id'] as String,
      name: map['name'] as String,
      icon: map['icon'] as String,
      data: Map.from((map['data'] as Map)),
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialLink.fromJson(String source) => SocialLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SocialLink(id: $id, name: $name, icon: $icon, data: $data, type: $type)';
  }

  @override
  bool operator ==(covariant SocialLink other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.icon == icon &&
      mapEquals(other.data, data) &&
      other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      icon.hashCode ^
      data.hashCode ^
      type.hashCode;
  }
}
