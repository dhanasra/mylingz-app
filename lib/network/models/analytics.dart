// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Analytics {

  final String device;
  final Map? location;
  final DateTime dateTime;

  Analytics({
    required this.device,
    this.location,
    required this.dateTime,
  });

  Analytics copyWith({
    String? device,
    Map? location,
    DateTime? dateTime,
  }) {
    return Analytics(
      device: device ?? this.device,
      location: location ?? this.location,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'device': device,
      'location': location,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory Analytics.fromMap(map) {
    return Analytics(
      device: map['device'] as String,
      location: map['location'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Analytics.fromJson(String source) => Analytics.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Analytics(device: $device, location: $location, dateTime: $dateTime)';

  @override
  bool operator ==(covariant Analytics other) {
    if (identical(this, other)) return true;
  
    return 
      other.device == device &&
      mapEquals(other.location, location) &&
      other.dateTime == dateTime;
  }

  @override
  int get hashCode => device.hashCode ^ location.hashCode ^ dateTime.hashCode;
}
