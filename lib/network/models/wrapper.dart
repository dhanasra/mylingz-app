// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Wrapper {
  final String? style;
  final String? color;

  Wrapper({
    this.style,
    this.color,
  });

  Wrapper copyWith({
    String? style,
    String? color,
  }) {
    return Wrapper(
      style: style ?? this.style,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'style': style,
      'color': color,
    };
  }

  factory Wrapper.fromMap(map) {
    return Wrapper(
      style: map['style'] != null ? map['style'] as String : null,
      color: map['color'] != null ? map['color'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wrapper.fromJson(String source) => Wrapper.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Wrapper(style: $style, color: $color)';

  @override
  bool operator ==(covariant Wrapper other) {
    if (identical(this, other)) return true;
  
    return 
      other.style == style &&
      other.color == color;
  }

  @override
  int get hashCode => style.hashCode ^ color.hashCode;
}
