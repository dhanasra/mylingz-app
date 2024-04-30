// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BioLinkButton {
  final int idx;
  final String id;
  final String text;
  final String? thumbnail;
  final String url;
  final int btnAnimation;
  final bool enabled;
  
  BioLinkButton({
    required this.idx,
    required this.id,
    required this.text,
    this.thumbnail,
    required this.url,
    this.btnAnimation = 0,
    this.enabled = true,
  });


  BioLinkButton copyWith({
    int? idx,
    String? id,
    String? text,
    String? thumbnail,
    String? url,
    int? btnAnimation,
    bool? enabled,
  }) {
    return BioLinkButton(
      idx: idx ?? this.idx,
      id: id ?? this.id,
      text: text ?? this.text,
      thumbnail: thumbnail ?? this.thumbnail,
      url: url ?? this.url,
      btnAnimation: btnAnimation ?? this.btnAnimation,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'id': id,
      'text': text,
      'thumbnail': thumbnail,
      'url': url,
      'btnAnimation': btnAnimation,
      'enabled': enabled,
    };
  }

  factory BioLinkButton.fromMap(Map<String, dynamic> map) {
    return BioLinkButton(
      idx: map['idx'] as int,
      id: map['id'] as String,
      text: map['text'] as String,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      url: map['url'] as String,
      btnAnimation: map['btnAnimation'] as int,
      enabled: map['enabled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory BioLinkButton.fromJson(String source) => BioLinkButton.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BioLinkButton(idx: $idx, id: $id, text: $text, thumbnail: $thumbnail, url: $url, btnAnimation: $btnAnimation, enabled: $enabled)';
  }

  @override
  bool operator ==(covariant BioLinkButton other) {
    if (identical(this, other)) return true;
  
    return 
      other.idx == idx &&
      other.id == id &&
      other.text == text &&
      other.thumbnail == thumbnail &&
      other.url == url &&
      other.btnAnimation == btnAnimation &&
      other.enabled == enabled;
  }

  @override
  int get hashCode {
    return idx.hashCode ^
      id.hashCode ^
      text.hashCode ^
      thumbnail.hashCode ^
      url.hashCode ^
      btnAnimation.hashCode ^
      enabled.hashCode;
  }
}
