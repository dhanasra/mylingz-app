import 'package:flutter/material.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/network/models/chart_data.dart';
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

  List<ChartData> chartData = [];
  List analytics = [
    { "label": "Total Clicks", "value": 12, "icon": const Icon(Icons.ads_click_outlined, color: Colors.greenAccent), "color": Colors.greenAccent },
    { "label": "Today's Clicks", "value": 12, "icon": const Icon(Icons.ads_click_outlined, color: Colors.purpleAccent), "color": Colors.purpleAccent },
    { "label": "Top Location", "value": "Chennai", "icon": const Icon(Icons.room_outlined, color: Colors.blueAccent), "color": Colors.blueAccent },
    { "label": "Top Device", "value": "Mobile", "icon": const Icon(Icons.device_hub_outlined, color: Colors.deepOrangeAccent), "color": Colors.deepOrangeAccent }
  ];

  LinkDetailsViewModel(String linkId){
    shortLink = Global.links.firstWhere((element) => element.id==linkId);
  }
  
  @override
  dispose() {

  }
}