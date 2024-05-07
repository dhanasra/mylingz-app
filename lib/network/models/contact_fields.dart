// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContactFields {
  final int idx;
  final String id;
  final String label;
  final String? value;
  final bool required;

  ContactFields({
    required this.idx,
    required this.id,
    required this.label,
    this.value,
    required this.required,
  });

  ContactFields copyWith({
    int? idx,
    String? id,
    String? label,
    bool? required,
    String? value,
  }) {
    return ContactFields(
      idx: idx ?? this.idx,
      id: id ?? this.id,
      label: label ?? this.label,
      value: value,
      required: required ?? this.required,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'id': id,
      'label': label,
      'required': required,
    };
  }

  factory ContactFields.fromMap(Map<String, dynamic> map) {
    return ContactFields(
      idx: map['idx'] as int,
      id: map['id'] as String,
      label: map['label'] as String,
      required: map['required'] as bool,
      value: map['value']
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactFields.fromJson(String source) => ContactFields.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContactFields(idx: $idx, id: $id, label: $label, required: $required)';
  }

  @override
  bool operator ==(covariant ContactFields other) {
    if (identical(this, other)) return true;
  
    return 
      other.idx == idx &&
      other.id == id &&
      other.label == label &&
      other.required == required;
  }

  @override
  int get hashCode {
    return idx.hashCode ^
      id.hashCode ^
      label.hashCode ^
      required.hashCode;
  }
}
