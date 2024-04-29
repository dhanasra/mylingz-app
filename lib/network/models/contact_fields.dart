// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContactFields {
  final int idx;
  final String label;
  final bool required;
  
  ContactFields({
    required this.idx,
    required this.label,
    required this.required,
  });


  ContactFields copyWith({
    int? idx,
    String? label,
    bool? required,
  }) {
    return ContactFields(
      idx: idx ?? this.idx,
      label: label ?? this.label,
      required: required ?? this.required,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'label': label,
      'required': required,
    };
  }

  factory ContactFields.fromMap(Map<String, dynamic> map) {
    return ContactFields(
      idx: map['idx'] as int,
      label: map['label'] as String,
      required: map['required'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactFields.fromJson(String source) => ContactFields.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ContactFields(idx: $idx, label: $label, required: $required)';

  @override
  bool operator ==(covariant ContactFields other) {
    if (identical(this, other)) return true;
  
    return 
      other.idx == idx &&
      other.label == label &&
      other.required == required;
  }

  @override
  int get hashCode => idx.hashCode ^ label.hashCode ^ required.hashCode;
}
