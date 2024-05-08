// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mylingz_app/network/models/biolink_design.dart';
import 'package:mylingz_app/network/models/company.dart';
import 'package:mylingz_app/network/models/contact_fields.dart';
import 'package:mylingz_app/network/models/social_link.dart';

import 'bio_link_button.dart';




class BioLink {
  final String id;
  final String title;
  final String? slogan;
  final String? picture;
  final String? banner;
  final Company? company;
  final String bioId;
  final String domainName;
  final List<BioLinkButton> buttons;
  final List<SocialLink> icons;
  final List<ContactFields> contactFields;
  final bool promote;
  final BioLinkDesign? design;

  BioLink({
    required this.id,
    required this.title,
    this.slogan,
    this.picture,
    this.banner,
    this.company,
    required this.bioId,
    required this.domainName,
    this.buttons = const [],
    this.icons = const [],
    this.contactFields = const [],
    this.promote = false,
    this.design
  });

  BioLink copyWith({
    String? id,
    String? title,
    String? slogan,
    String? picture,
    String? banner,
    Company? company,
    String? bioId,
    String? domainName,
    List<BioLinkButton>? buttons,
    List<SocialLink>? icons,
    List<ContactFields>? contactFields,
    bool? promote,
    BioLinkDesign? design,
  }) {
    return BioLink(
      id: id ?? this.id,
      title: title ?? this.title,
      slogan: slogan ?? this.slogan,
      picture: picture ?? this.picture,
      banner: banner ?? this.banner,
      company: company ?? this.company,
      bioId: bioId ?? this.bioId,
      domainName: domainName ?? this.domainName,
      buttons: buttons ?? this.buttons,
      icons: icons ?? this.icons,
      contactFields: contactFields ?? this.contactFields,
      promote: promote ?? this.promote,
      design: design ?? this.design,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'slogan': slogan,
      'picture': picture,
      'banner': banner,
      'company': company?.toMap(),
      'bioId': bioId,
      'domainName': domainName,
      'buttons': buttons.map((x) => x.toMap()).toList(),
      'icons': icons.map((x) => x.toMap()).toList(),
      'contactFields': contactFields.map((x) => x.toMap()).toList(),
      'promote': promote,
      'design': design?.toMap(),
    };
  }

  factory BioLink.fromMap(map) {
    return BioLink(
      id: map['id'] as String,
      title: map['title'] as String,
      slogan: map['slogan'] != null ? map['slogan'] as String : null,
      picture: map['picture'] != null ? map['picture'] as String : null,
      banner: map['banner'] != null ? map['banner'] as String : null,
      company: map['company'] != null ? Company.fromMap(map['company'] as Map<String,dynamic>) : null,
      bioId: map['bioId'] as String,
      domainName: map['domainName'] as String,
      buttons: List<BioLinkButton>.from((map['buttons']).map<BioLinkButton>((x) => BioLinkButton.fromMap(x as Map<String,dynamic>),),),
      icons: List<SocialLink>.from((map['icons']).map<SocialLink>((x) => SocialLink.fromMap(x as Map<String,dynamic>),),),
      contactFields: List<ContactFields>.from((map['contactFields']).map<ContactFields>((x) => ContactFields.fromMap(x as Map<String,dynamic>),),),
      promote: map['promote'] as bool,
      design: map['design'] != null ? BioLinkDesign.fromMap(map['design']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BioLink.fromJson(String source) => BioLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BioLink(id: $id, title: $title, slogan: $slogan, picture: $picture, banner: $banner, company: $company, bioId: $bioId, domainName: $domainName, buttons: $buttons, icons: $icons, contactFields: $contactFields, promote: $promote, design: $design)';
  }

  @override
  bool operator ==(covariant BioLink other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.slogan == slogan &&
      other.picture == picture &&
      other.banner == banner &&
      other.company == company &&
      other.bioId == bioId &&
      other.domainName == domainName &&
      listEquals(other.buttons, buttons) &&
      listEquals(other.icons, icons) &&
      listEquals(other.contactFields, contactFields) &&
      other.promote == promote &&
      other.design == design;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      slogan.hashCode ^
      picture.hashCode ^
      banner.hashCode ^
      company.hashCode ^
      bioId.hashCode ^
      domainName.hashCode ^
      buttons.hashCode ^
      icons.hashCode ^
      contactFields.hashCode ^
      promote.hashCode ^
      design.hashCode;
  }
}
