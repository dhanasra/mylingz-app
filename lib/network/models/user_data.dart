import 'dart:convert';

class UserData {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String? picture;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.picture,
  });

  UserData copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? picture,
  }) {
    return UserData(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'picture': picture,
    };
  }

  factory UserData.fromMap(map) {
    return UserData(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      picture: map['picture'] != null ? map['picture'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) => UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, picture: $picture)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.phone == phone &&
      other.picture == picture;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      picture.hashCode;
  }
}
