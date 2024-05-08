// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Thumbnail {
  final String style;
  final String? color;

  Thumbnail({
    this.style = "outlined",
    this.color,
  });

  Thumbnail copyWith({
    String? style,
    String? color,
  }) {
    return Thumbnail(
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

  factory Thumbnail.fromMap(map) {
    return Thumbnail(
      style: map['style'] != null ? map['style'] as String : "outlined",
      color: map['color'] != null ? map['color'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromJson(String source) => Thumbnail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Thumbnail(style: $style, color: $color)';

  @override
  bool operator ==(covariant Thumbnail other) {
    if (identical(this, other)) return true;
  
    return 
      other.style == style &&
      other.color == color;
  }

  @override
  int get hashCode => style.hashCode ^ color.hashCode;
}
