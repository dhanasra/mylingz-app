import 'dart:convert';

class SocialIcon {
  final String name;
  final String icon;
  final String type;
  final String id;
  final String category;

  SocialIcon({
    required this.name,
    required this.icon,
    required this.type,
    required this.id,
    required this.category,
  });

  SocialIcon copyWith({
    String? name,
    String? icon,
    String? type,
    String? id,
    String? category,
  }) {
    return SocialIcon(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      type: type ?? this.type,
      id: id ?? this.id,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'icon': icon,
      'type': type,
      'id': id,
      'category': category,
    };
  }

  factory SocialIcon.fromMap(map) {
    return SocialIcon(
      name: map['name'] as String,
      icon: map['icon'] as String,
      type: map['type'] as String,
      id: map['id'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialIcon.fromJson(String source) => SocialIcon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SocialIcon(name: $name, icon: $icon, type: $type, id: $id, category: $category)';
  }

  @override
  bool operator ==(covariant SocialIcon other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.icon == icon &&
      other.type == type &&
      other.id == id &&
      other.category == category;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      icon.hashCode ^
      type.hashCode ^
      id.hashCode ^
      category.hashCode;
  }
}
