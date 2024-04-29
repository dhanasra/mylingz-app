// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Company {

  final String? name;
  final String? jobTitle;
  final String? location;

  Company({
    this.name,
    this.jobTitle,
    this.location,
  });

  Company copyWith({
    String? name,
    String? jobTitle,
    String? location,
  }) {
    return Company(
      name: name ?? this.name,
      jobTitle: jobTitle ?? this.jobTitle,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'jobTitle': jobTitle,
      'location': location,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'] != null ? map['name'] as String : null,
      jobTitle: map['jobTitle'] != null ? map['jobTitle'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) => Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Company(name: $name, jobTitle: $jobTitle, location: $location)';

  @override
  bool operator ==(covariant Company other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.jobTitle == jobTitle &&
      other.location == location;
  }

  @override
  int get hashCode => name.hashCode ^ jobTitle.hashCode ^ location.hashCode;
}
