import 'package:flutter/material.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';

import '../../../network/models/chart_data.dart';
import '../bloc/bio_link_bloc.dart';

class BioLinkAnalyticsViewModel extends BaseViewModel {
  
  List<ChartData> chartData = [];
  List analytics = [
    { "label": "Total Clicks", "value": 0, "icon": const Icon(Icons.ads_click_outlined, color: Colors.greenAccent), "color": Colors.greenAccent },
    { "label": "Today's Clicks", "value": 0, "icon": const Icon(Icons.ads_click_outlined, color: Colors.purpleAccent), "color": Colors.purpleAccent },
    { "label": "Top Location", "value": "N/A", "icon": const Icon(Icons.room_outlined, color: Colors.blueAccent), "color": Colors.blueAccent },
    { "label": "Top Device", "value": "N/A", "icon": const Icon(Icons.device_hub_outlined, color: Colors.deepOrangeAccent), "color": Colors.deepOrangeAccent }
  ];

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