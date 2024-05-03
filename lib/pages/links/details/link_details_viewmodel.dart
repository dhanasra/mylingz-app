import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/network/models/chart_data.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/pages/links/bloc/links_bloc.dart';
import 'package:mylingz_app/utils/global.dart';

import '../../../network/local_db.dart';

class LinkDetailsViewModel extends BaseViewModel {
  late ShortLink shortLink;
  late bool isFavourite;

  final List options = [
    { "label": "Remove", "icon": Icons.delete_outlined, "id": "remove" },
    { "label": "Edit", "icon": Icons.edit_outlined, "id": "edit" },
    { "label": "Copy", "icon": Icons.copy_outlined, "id": "copy" },
    { "label": "Share", "icon": Icons.share_outlined, "id": "share" },
  ];
  List analytics = [
    { "label": "Total Clicks", "value": 0, "icon": const Icon(Icons.ads_click_outlined, color: Colors.greenAccent), "color": Colors.greenAccent },
    { "label": "Today's Clicks", "value": 0, "icon": const Icon(Icons.ads_click_outlined, color: Colors.purpleAccent), "color": Colors.purpleAccent },
    { "label": "Top Location", "value": "N/A", "icon": const Icon(Icons.room_outlined, color: Colors.blueAccent), "color": Colors.blueAccent },
    { "label": "Top Device", "value": "N/A", "icon": const Icon(Icons.device_hub_outlined, color: Colors.deepOrangeAccent), "color": Colors.deepOrangeAccent }
  ];

  List<ChartData> chartData = [];

  LinkDetailsViewModel(String linkId, BuildContext context){
    shortLink = Global.links.firstWhere((element) => element.id==linkId);
    context.read<LinksBloc>().add(GetLinkAnalyticsEvent(linkId: shortLink.short));
    isFavourite = Global.favourites.value.any((element) => element.id == shortLink.id);
  }

  updateFavourite(isLiked){
    LocalDB().saveFavourite(shortLink.id);
    if(isLiked){
      Global.favourites.value = [ ...Global.favourites.value, shortLink ];
    }else{
      Global.favourites.value = Global.favourites.value.where((element) => element.id!=shortLink.id).toList();
    }
  }

  setupStatistics(AnalyticsFetched item){
    analytics[0]["value"] = item.totalClicks;
    analytics[1]["value"] = item.todayClicks;
    analytics[2]["value"] = item.location;
    analytics[3]["value"] = item.device;
    chartData = item.chart;
  }
  
  @override
  dispose() {

  }
}