// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Content {
  final String? color;
  final String? weight;
  final String? size;
  final String? family;

  Content({
    this.color,
    this.weight,
    this.size,
    this.family,
  });

  Content copyWith({
    String? color,
    String? weight,
    String? size,
    String? family,
  }) {
    return Content(
      color: color ?? this.color,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      family: family ?? this.family,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'weight': weight,
      'size': size,
      'family': family,
    };
  }

  factory Content.fromMap(map) {
    return Content(
      color: map['color'] != null ? map['color'] as String : null,
      weight: map['weight'] != null ? map['weight'] as String : null,
      size: map['size'] != null ? map['size'] as String : null,
      family: map['family'] != null ? map['family'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Content.fromJson(String source) => Content.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Content(color: $color, weight: $weight, size: $size, family: $family)';
  }

  @override
  bool operator ==(covariant Content other) {
    if (identical(this, other)) return true;
  
    return 
      other.color == color &&
      other.weight == weight &&
      other.size == size &&
      other.family == family;
  }

  @override
  int get hashCode {
    return color.hashCode ^
      weight.hashCode ^
      size.hashCode ^
      family.hashCode;
  }
}
