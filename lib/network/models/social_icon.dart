// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SocialIcon {
  final String name;
  final String url;
  final String link;

  SocialIcon({
    required this.name,
    required this.url,
    required this.link,
  });

  SocialIcon copyWith({
    String? name,
    String? url,
    String? link,
  }) {
    return SocialIcon(
      name: name ?? this.name,
      url: url ?? this.url,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
      'link': link,
    };
  }

  factory SocialIcon.fromMap(Map<String, dynamic> map) {
    return SocialIcon(
      name: map['name'] as String,
      url: map['url'] as String,
      link: map['link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialIcon.fromJson(String source) => SocialIcon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SocialIcon(name: $name, url: $url, link: $link)';

  @override
  bool operator ==(covariant SocialIcon other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.url == url &&
      other.link == link;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode ^ link.hashCode;
}
