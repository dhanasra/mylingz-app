import 'dart:convert';

import '../../constants/url_const.dart';

class ShortLink {

  final String id;
  final String url;
  final String short;
  final String domain;
  final String? title;
  final bool bioLink;
  final String? bioLinkBtnLabel;
  final String createdBy;
  final DateTime createdAt;
  
  ShortLink({
    required this.id,
    required this.url,
    required this.short,
    this.domain = UrlConst.domainName,
    this.title,
    this.bioLink = false,
    this.bioLinkBtnLabel,
    required this.createdBy,
    required this.createdAt,
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
    String? createdBy,
    DateTime? createdAt,
  }) {
    return ShortLink(
      id: id ?? this.id,
      url: url ?? this.url,
      short: short ?? this.short,
      domain: domain ?? this.domain,
      title: title ?? this.title,
      bioLink: bioLink ?? this.bioLink,
      bioLinkBtnLabel: bioLinkBtnLabel ?? this.bioLinkBtnLabel,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'short': short,
      'domain': domain,
      'title': title,
      'bioLink': bioLink,
      'bioLinkBtnLabel': bioLinkBtnLabel,
      'createdBy': createdBy,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ShortLink.fromMap(map) {
    return ShortLink(
      id: map['id'] as String,
      url: map['url'] as String,
      short: map['short'] as String,
      domain: map['domain'] as String,
      title: map['title'] != null ? map['title'] as String : null,
      bioLink: map['bioLink'] as bool,
      bioLinkBtnLabel: map['bioLinkBtnLabel'] != null ? map['bioLinkBtnLabel'] as String : null,
      createdBy: map['createdBy'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortLink.fromJson(String source) => ShortLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShortLink(id: $id, url: $url, short: $short, domain: $domain, title: $title, bioLink: $bioLink, bioLinkBtnLabel: $bioLinkBtnLabel, createdBy: $createdBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant ShortLink other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.url == url &&
      other.short == short &&
      other.domain == domain &&
      other.title == title &&
      other.bioLink == bioLink &&
      other.bioLinkBtnLabel == bioLinkBtnLabel &&
      other.createdBy == createdBy &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      url.hashCode ^
      short.hashCode ^
      domain.hashCode ^
      title.hashCode ^
      bioLink.hashCode ^
      bioLinkBtnLabel.hashCode ^
      createdBy.hashCode ^
      createdAt.hashCode;
  }
}
