// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mylingz_app/network/models/thumbnail.dart';
import 'package:mylingz_app/network/models/wrapper.dart';

import 'content.dart';

class BioLinkDesign {
  final String? color;
  final String? style;
  final String? cornerType;
  final String? alignment;
  final Thumbnail? thumbnail;
  final Wrapper? wrapper;
  final Content? content;
  final String? actionBtnStyle;

  
  BioLinkDesign({
    this.color,
    this.style,
    this.cornerType,
    this.alignment,
    this.thumbnail,
    this.wrapper,
    this.content,
    this.actionBtnStyle,
  });


  BioLinkDesign copyWith({
    String? color,
    String? style,
    String? cornerType,
    String? alignment,
    Thumbnail? thumbnail,
    Wrapper? wrapper,
    Content? content,
    String? actionBtnStyle,
  }) {
    return BioLinkDesign(
      color: color ?? this.color,
      style: style ?? this.style,
      cornerType: cornerType ?? this.cornerType,
      alignment: alignment ?? this.alignment,
      thumbnail: thumbnail ?? this.thumbnail,
      wrapper: wrapper ?? this.wrapper,
      content: content ?? this.content,
      actionBtnStyle: actionBtnStyle ?? this.actionBtnStyle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'style': style,
      'cornerType': cornerType,
      'alignment': alignment,
      'thumbnail': thumbnail?.toMap(),
      'wrapper': wrapper?.toMap(),
      'content': content?.toMap(),
      'actionBtnStyle': actionBtnStyle,
    };
  }

  factory BioLinkDesign.fromMap(map) {
    return BioLinkDesign(
      color: map['color'] != null ? map['color'] as String : null,
      style: map['style'] != null ? map['style'] as String : null,
      cornerType: map['cornerType'] != null ? map['cornerType'] as String : null,
      alignment: map['alignment'] != null ? map['alignment'] as String : null,
      thumbnail: map['thumbnail'] != null ? Thumbnail.fromMap(map['thumbnail']) : null,
      wrapper: map['wrapper'] != null ? Wrapper.fromMap(map['wrapper']) : null,
      content: map['content'] != null ? Content.fromMap(map['content']) : null,
      actionBtnStyle: map['actionBtnStyle'] != null ? map['actionBtnStyle'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BioLinkDesign.fromJson(String source) => BioLinkDesign.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BioLinkDesign(color: $color, style: $style, cornerType: $cornerType, alignment: $alignment, thumbnail: $thumbnail, wrapper: $wrapper, content: $content, actionBtnStyle: $actionBtnStyle)';
  }

  @override
  bool operator ==(covariant BioLinkDesign other) {
    if (identical(this, other)) return true;
  
    return 
      other.color == color &&
      other.style == style &&
      other.cornerType == cornerType &&
      other.alignment == alignment &&
      other.thumbnail == thumbnail &&
      other.wrapper == wrapper &&
      other.content == content &&
      other.actionBtnStyle == actionBtnStyle;
  }

  @override
  int get hashCode {
    return color.hashCode ^
      style.hashCode ^
      cornerType.hashCode ^
      alignment.hashCode ^
      thumbnail.hashCode ^
      wrapper.hashCode ^
      content.hashCode ^
      actionBtnStyle.hashCode;
  }
}
