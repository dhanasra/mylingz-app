// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ActionBtnStyle {
  final String? color;
  final String? bgColor;
  final String? borderColor;

  ActionBtnStyle({
    this.color,
    this.bgColor,
    this.borderColor,
  });


  ActionBtnStyle copyWith({
    String? color,
    String? bgColor,
    String? borderColor,
  }) {
    return ActionBtnStyle(
      color: color ?? this.color,
      bgColor: bgColor ?? this.bgColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'bgColor': bgColor,
      'borderColor': borderColor,
    };
  }

  factory ActionBtnStyle.fromMap(map) {
    return ActionBtnStyle(
      color: map['color'] != null ? map['color'] as String : null,
      bgColor: map['bgColor'] != null ? map['bgColor'] as String : null,
      borderColor: map['borderColor'] != null ? map['borderColor'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActionBtnStyle.fromJson(String source) => ActionBtnStyle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ActionBtnStyle(color: $color, bgColor: $bgColor, borderColor: $borderColor)';

  @override
  bool operator ==(covariant ActionBtnStyle other) {
    if (identical(this, other)) return true;
  
    return 
      other.color == color &&
      other.bgColor == bgColor &&
      other.borderColor == borderColor;
  }

  @override
  int get hashCode => color.hashCode ^ bgColor.hashCode ^ borderColor.hashCode;
}
