import 'package:flutter/material.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/utils/global.dart';

class LinkDetailsViewModel extends BaseViewModel {
  late ShortLink shortLink;

  final List options = [
    { "label": "Remove", "icon": Icons.delete_outlined, "id": "remove" },
    { "label": "Edit", "icon": Icons.edit_outlined, "id": "edit" },
    { "label": "Copy", "icon": Icons.copy_outlined, "id": "copy" },
    { "label": "Share", "icon": Icons.share_outlined, "id": "share" },
  ];

  LinkDetailsViewModel(String linkId){
    shortLink = Global.links.firstWhere((element) => element.id==linkId);
  }
  
  @override
  dispose() {

  }
}