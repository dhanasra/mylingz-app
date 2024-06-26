// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Wrapper {
  final String? style;
  final String? color;
  final String? bgColor;
  final String? borderColor;

  Wrapper({
    this.style,
    this.color,
    this.bgColor,
    this.borderColor,
  });


  Wrapper copyWith({
    String? style,
    String? color,
    String? bgColor,
    String? borderColor,
  }) {
    return Wrapper(
      style: style ?? this.style,
      color: color ?? this.color,
      bgColor: bgColor ?? this.bgColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'style': style,
      'color': color,
      'bgColor': bgColor,
      'borderColor': borderColor,
    };
  }

  factory Wrapper.fromMap(map) {
    return Wrapper(
      style: map['style'] != null ? map['style'] as String : null,
      color: map['color'] != null ? map['color'] as String : null,
      bgColor: map['bgColor'] != null ? map['bgColor'] as String : null,
      borderColor: map['borderColor'] != null ? map['borderColor'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wrapper.fromJson(String source) => Wrapper.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Wrapper(style: $style, color: $color, bgColor: $bgColor, borderColor: $borderColor)';
  }

  @override
  bool operator ==(covariant Wrapper other) {
    if (identical(this, other)) return true;
  
    return 
      other.style == style &&
      other.color == color &&
      other.bgColor == bgColor &&
      other.borderColor == borderColor;
  }

  @override
  int get hashCode {
    return style.hashCode ^
      color.hashCode ^
      bgColor.hashCode ^
      borderColor.hashCode;
  }
}
