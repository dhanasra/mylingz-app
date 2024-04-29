// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BioLinkButton {
  final int idx;
  final String text;
  final String? thumbnail;
  final String url;
  final int btnAnimation;

  BioLinkButton({
    required this.idx,
    required this.text,
    this.thumbnail,
    required this.url,
    required this.btnAnimation,
  });

  BioLinkButton copyWith({
    int? idx,
    String? text,
    String? thumbnail,
    String? url,
    int? btnAnimation,
  }) {
    return BioLinkButton(
      idx: idx ?? this.idx,
      text: text ?? this.text,
      thumbnail: thumbnail ?? this.thumbnail,
      url: url ?? this.url,
      btnAnimation: btnAnimation ?? this.btnAnimation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'text': text,
      'thumbnail': thumbnail,
      'url': url,
      'btnAnimation': btnAnimation,
    };
  }

  factory BioLinkButton.fromMap(Map<String, dynamic> map) {
    return BioLinkButton(
      idx: map['idx'] as int,
      text: map['text'] as String,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      url: map['url'] as String,
      btnAnimation: map['btnAnimation'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BioLinkButton.fromJson(String source) => BioLinkButton.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BioLinkButton(idx: $idx, text: $text, thumbnail: $thumbnail, url: $url, btnAnimation: $btnAnimation)';
  }

  @override
  bool operator ==(covariant BioLinkButton other) {
    if (identical(this, other)) return true;
  
    return 
      other.idx == idx &&
      other.text == text &&
      other.thumbnail == thumbnail &&
      other.url == url &&
      other.btnAnimation == btnAnimation;
  }

  @override
  int get hashCode {
    return idx.hashCode ^
      text.hashCode ^
      thumbnail.hashCode ^
      url.hashCode ^
      btnAnimation.hashCode;
  }
}
