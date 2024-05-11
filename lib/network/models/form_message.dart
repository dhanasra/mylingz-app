// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mylingz_app/network/models/contact_fields.dart';

class FormMessage {
  final String id;
  final List<ContactFields> data;
  final String device;
  final Map location;
  final DateTime createdAt;

  FormMessage({
    required this.id,
    required this.data,
    required this.device,
    required this.location,
    required this.createdAt,
  });

  FormMessage copyWith({
    String? id,
    List<ContactFields>? data,
    String? device,
    Map? location,
    DateTime? createdAt,
  }) {
    return FormMessage(
      id: id ?? this.id,
      data: data ?? this.data,
      device: device ?? this.device,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'data': data.map((x) => x.toMap()).toList(),
      'device': device,
      'location': location,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory FormMessage.fromMap(map) {
    return FormMessage(
      id: map['id'],
      data: List<ContactFields>.from((map['data']).map<ContactFields>((x) => ContactFields.fromMap(x as Map<String,dynamic>),),),
      device: map['device'] as String,
      location: map['location'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory FormMessage.fromJson(String source) => FormMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FormMessage(data: $data, device: $device, location: $location, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant FormMessage other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.data, data) &&
      other.device == device &&
      other.location == location &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return data.hashCode ^
      device.hashCode ^
      location.hashCode ^
      createdAt.hashCode;
  }
}
