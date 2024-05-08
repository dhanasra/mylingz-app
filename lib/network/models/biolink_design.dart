// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mylingz_app/network/models/action_btn_style.dart';
import 'package:mylingz_app/network/models/profile_design.dart';
import 'package:mylingz_app/network/models/thumbnail.dart';
import 'package:mylingz_app/network/models/wrapper.dart';

import 'content.dart';

class BioLinkDesign {
  final String? color;
  final String? style;
  final double? cornerRadius;
  final double? outline;
  final String? alignment;
  final Thumbnail? thumbnail;
  final Wrapper? wrapper;
  final Content? content;
  final ActionBtnStyle? actionBtnStyle;
  final ProfileDesign? profileDesign;


  BioLinkDesign({
    this.color,
    this.style,
    this.cornerRadius,
    this.outline,
    this.alignment,
    this.thumbnail,
    this.wrapper,
    this.content,
    this.actionBtnStyle,
    this.profileDesign,
  });


  BioLinkDesign copyWith({
    String? color,
    String? style,
    double? cornerRadius,
    double? outline,
    String? alignment,
    Thumbnail? thumbnail,
    Wrapper? wrapper,
    Content? content,
    ActionBtnStyle? actionBtnStyle,
    ProfileDesign? profileDesign,
  }) {
    return BioLinkDesign(
      color: color ?? this.color,
      style: style ?? this.style,
      cornerRadius: cornerRadius ?? this.cornerRadius,
      outline: outline ?? this.outline,
      alignment: alignment ?? this.alignment,
      thumbnail: thumbnail ?? this.thumbnail,
      wrapper: wrapper ?? this.wrapper,
      content: content ?? this.content,
      actionBtnStyle: actionBtnStyle ?? this.actionBtnStyle,
      profileDesign: profileDesign ?? this.profileDesign,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'style': style,
      'cornerRadius': cornerRadius,
      'outline': outline,
      'alignment': alignment,
      'thumbnail': thumbnail?.toMap(),
      'wrapper': wrapper?.toMap(),
      'content': content?.toMap(),
      'actionBtnStyle': actionBtnStyle?.toMap(),
      'profileDesign': profileDesign?.toMap(),
    };
  }

  factory BioLinkDesign.fromMap(map) {
    return BioLinkDesign(
      color: map['color'] != null ? map['color'] as String : null,
      style: map['style'] != null ? map['style'] as String : null,
      cornerRadius: map['cornerRadius'] != null ? map['cornerRadius'] as double : null,
      outline: map['outline'] != null ? map['outline'] as double : null,
      alignment: map['alignment'] != null ? map['alignment'] as String : null,
      thumbnail: map['thumbnail'] != null ? Thumbnail.fromMap(map['thumbnail'] as Map<String,dynamic>) : null,
      wrapper: map['wrapper'] != null ? Wrapper.fromMap(map['wrapper'] as Map<String,dynamic>) : null,
      content: map['content'] != null ? Content.fromMap(map['content'] as Map<String,dynamic>) : null,
      actionBtnStyle: map['actionBtnStyle'] != null ? ActionBtnStyle.fromMap(map['actionBtnStyle'] as Map<String,dynamic>) : null,
      profileDesign: map['profileDesign'] != null ? ProfileDesign.fromMap(map['profileDesign'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BioLinkDesign.fromJson(String source) => BioLinkDesign.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BioLinkDesign(color: $color, style: $style, cornerRadius: $cornerRadius, outline: $outline, alignment: $alignment, thumbnail: $thumbnail, wrapper: $wrapper, content: $content, actionBtnStyle: $actionBtnStyle, profileDesign: $profileDesign)';
  }

  @override
  bool operator ==(covariant BioLinkDesign other) {
    if (identical(this, other)) return true;
  
    return 
      other.color == color &&
      other.style == style &&
      other.cornerRadius == cornerRadius &&
      other.outline == outline &&
      other.alignment == alignment &&
      other.thumbnail == thumbnail &&
      other.wrapper == wrapper &&
      other.content == content &&
      other.actionBtnStyle == actionBtnStyle &&
      other.profileDesign == profileDesign;
  }

  @override
  int get hashCode {
    return color.hashCode ^
      style.hashCode ^
      cornerRadius.hashCode ^
      outline.hashCode ^
      alignment.hashCode ^
      thumbnail.hashCode ^
      wrapper.hashCode ^
      content.hashCode ^
      actionBtnStyle.hashCode ^
      profileDesign.hashCode;
  }
}
