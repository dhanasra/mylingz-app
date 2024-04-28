import 'dart:convert';

import '../../constants/url_const.dart';

class ShortLink {

  final String id;
  final String url;
  final String short;
  final String domain;
  final String? backHalf;
  final String? title;
  final bool bioLink;
  final String? bioLinkBtnLabel;

  ShortLink({
    required this.id,
    required this.url,
    required this.short,
    this.domain = UrlConst.domainName,
    this.backHalf,
    this.title,
    this.bioLink = false,
    this.bioLinkBtnLabel,
  });

  ShortLink copyWith({
    String? id,
    String? url,
    String? short,
    String? domain,
    String? backHalf,
    String? title,
    bool? bioLink,
    String? bioLinkBtnLabel,
  }) {
    return ShortLink(
      id: id ?? this.id,
      url: url ?? this.url,
      short: short ?? this.short,
      domain: domain ?? this.domain,
      backHalf: backHalf ?? this.backHalf,
      title: title ?? this.title,
      bioLink: bioLink ?? this.bioLink,
      bioLinkBtnLabel: bioLinkBtnLabel ?? this.bioLinkBtnLabel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'short': short,
      'domain': domain,
      'backHalf': backHalf,
      'title': title,
      'bioLink': bioLink,
      'bioLinkBtnLabel': bioLinkBtnLabel,
    };
  }

  factory ShortLink.fromMap(Map<String, dynamic> map) {
    return ShortLink(
      id: map['id'] as String,
      url: map['url'] as String,
      short: map['short'] as String,
      domain: map['domain'] as String,
      backHalf: map['backHalf'] != null ? map['backHalf'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      bioLink: map['bioLink'] as bool,
      bioLinkBtnLabel: map['bioLinkBtnLabel'] != null ? map['bioLinkBtnLabel'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortLink.fromJson(String source) => ShortLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShortLink(id: $id, url: $url, short: $short, domain: $domain, backHalf: $backHalf, title: $title, bioLink: $bioLink, bioLinkBtnLabel: $bioLinkBtnLabel)';
  }

  @override
  bool operator ==(covariant ShortLink other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.url == url &&
      other.short == short &&
      other.domain == domain &&
      other.backHalf == backHalf &&
      other.title == title &&
      other.bioLink == bioLink &&
      other.bioLinkBtnLabel == bioLinkBtnLabel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      url.hashCode ^
      short.hashCode ^
      domain.hashCode ^
      backHalf.hashCode ^
      title.hashCode ^
      bioLink.hashCode ^
      bioLinkBtnLabel.hashCode;
  }
}
