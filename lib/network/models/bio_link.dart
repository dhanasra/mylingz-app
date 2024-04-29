// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mylingz_app/network/models/company.dart';
import 'package:mylingz_app/network/models/contact_fields.dart';
import 'package:mylingz_app/network/models/social_icon.dart';

import 'bio_link_button.dart';

class BioLink {
  final String name;
  final String? description;
  final String? picture;
  final String? banner;
  final Company? company;
  final String bioId;
  final String domainName;
  final List<BioLinkButton> buttons;
  final List<SocialIcon> icons;
  final List<ContactFields> contactFields;

  BioLink({
    required this.name,
    this.description,
    this.picture,
    this.banner,
    this.company,
    required this.bioId,
    required this.domainName,
    this.buttons = const [],
    this.icons = const [],
    this.contactFields = const []
  });


  BioLink copyWith({
    String? name,
    String? description,
    String? picture,
    String? banner,
    Company? company,
    String? bioId,
    String? domainName,
    List<BioLinkButton>? buttons,
    List<SocialIcon>? icons,
    List<ContactFields>? contactFields,
  }) {
    return BioLink(
      name: name ?? this.name,
      description: description ?? this.description,
      picture: picture ?? this.picture,
      banner: banner ?? this.banner,
      company: company ?? this.company,
      bioId: bioId ?? this.bioId,
      domainName: domainName ?? this.domainName,
      buttons: buttons ?? this.buttons,
      icons: icons ?? this.icons,
      contactFields: contactFields ?? this.contactFields,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'picture': picture,
      'banner': banner,
      'company': company?.toMap(),
      'bioId': bioId,
      'domainName': domainName,
      'buttons': buttons.map((x) => x.toMap()).toList(),
      'icons': icons.map((x) => x.toMap()).toList(),
      'contactFields': contactFields.map((x) => x.toMap()).toList(),
    };
  }

  factory BioLink.fromMap(Map<String, dynamic> map) {
    return BioLink(
      name: map['name'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      picture: map['picture'] != null ? map['picture'] as String : null,
      banner: map['banner'] != null ? map['banner'] as String : null,
      company: map['company'] != null ? Company.fromMap(map['company'] as Map<String,dynamic>) : null,
      bioId: map['bioId'] as String,
      domainName: map['domainName'] as String,
      buttons: List<BioLinkButton>.from((map['buttons'] as List<int>).map<BioLinkButton>((x) => BioLinkButton.fromMap(x as Map<String,dynamic>),),),
      icons: List<SocialIcon>.from((map['icons'] as List<int>).map<SocialIcon>((x) => SocialIcon.fromMap(x as Map<String,dynamic>),),),
      contactFields: List<ContactFields>.from((map['contactFields'] as List<int>).map<ContactFields>((x) => ContactFields.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory BioLink.fromJson(String source) => BioLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BioLink(name: $name, description: $description, picture: $picture, banner: $banner, company: $company, bioId: $bioId, domainName: $domainName, buttons: $buttons, icons: $icons, contactFields: $contactFields)';
  }

  @override
  bool operator ==(covariant BioLink other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.picture == picture &&
      other.banner == banner &&
      other.company == company &&
      other.bioId == bioId &&
      other.domainName == domainName &&
      listEquals(other.buttons, buttons) &&
      listEquals(other.icons, icons) &&
      listEquals(other.contactFields, contactFields);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      picture.hashCode ^
      banner.hashCode ^
      company.hashCode ^
      bioId.hashCode ^
      domainName.hashCode ^
      buttons.hashCode ^
      icons.hashCode ^
      contactFields.hashCode;
  }
}
