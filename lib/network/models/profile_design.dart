// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileDesign {
  String? layout;
  String? alignment;
  double? size;
  double? corner;
  String? titleColor;
  String? sloganColor;

  ProfileDesign({
    this.layout,
    this.alignment,
    this.size,
    this.corner,
    this.titleColor,
    this.sloganColor,
  });

  ProfileDesign copyWith({
    String? layout,
    String? alignment,
    double? size,
    double? corner,
    String? titleColor,
    String? sloganColor,
  }) {
    return ProfileDesign(
      layout: layout ?? this.layout,
      alignment: alignment ?? this.alignment,
      size: size ?? this.size,
      corner: corner ?? this.corner,
      titleColor: titleColor ?? this.titleColor,
      sloganColor: sloganColor ?? this.sloganColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'layout': layout,
      'alignment': alignment,
      'size': size,
      'corner': corner,
      'titleColor': titleColor,
      'sloganColor': sloganColor,
    };
  }

  factory ProfileDesign.fromMap(Map<String, dynamic> map) {
    return ProfileDesign(
      layout: map['layout'] != null ? map['layout'] as String : null,
      alignment: map['alignment'] != null ? map['alignment'] as String : null,
      size: map['size'] != null ? map['size'] as double : null,
      corner: map['corner'] != null ? map['corner'] as double : null,
      titleColor: map['titleColor'] != null ? map['titleColor'] as String : null,
      sloganColor: map['sloganColor'] != null ? map['sloganColor'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileDesign.fromJson(String source) => ProfileDesign.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileDesign(layout: $layout, alignment: $alignment, size: $size, corner: $corner, titleColor: $titleColor, sloganColor: $sloganColor)';
  }

  @override
  bool operator ==(covariant ProfileDesign other) {
    if (identical(this, other)) return true;
  
    return 
      other.layout == layout &&
      other.alignment == alignment &&
      other.size == size &&
      other.corner == corner &&
      other.titleColor == titleColor &&
      other.sloganColor == sloganColor;
  }

  @override
  int get hashCode {
    return layout.hashCode ^
      alignment.hashCode ^
      size.hashCode ^
      corner.hashCode ^
      titleColor.hashCode ^
      sloganColor.hashCode;
  }
}
