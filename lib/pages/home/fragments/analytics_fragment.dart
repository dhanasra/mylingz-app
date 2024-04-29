import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../../../network/models/chart_data.dart';
import '../../../widgets/line_chart.dart';
import '../../../widgets/styled_wrapper.dart';

class AnalyticsFragment extends StatelessWidget {
  const AnalyticsFragment({super.key});

  @override
  Widget build(BuildContext context) {

    List<ChartData> chartData = [];
    List analytics = [
      { "label": "Total Clicks", "value": 12, "icon": const Icon(Icons.ads_click_outlined, color: Colors.greenAccent), "color": Colors.greenAccent },
      { "label": "Today's Clicks", "value": 12, "icon": const Icon(Icons.ads_click_outlined, color: Colors.purpleAccent), "color": Colors.purpleAccent },
      { "label": "Top Location", "value": "Chennai", "icon": const Icon(Icons.room_outlined, color: Colors.blueAccent), "color": Colors.blueAccent },
      { "label": "Top Device", "value": "Mobile", "icon": const Icon(Icons.device_hub_outlined, color: Colors.deepOrangeAccent), "color": Colors.deepOrangeAccent }
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1
          ), 
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (_, idx){
            var item = analytics[idx];
            return StyledWrapper(
              p: const EdgeInsets.all(18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: (item["color"] as Color).withOpacity(0.1),
                    child: item["icon"],
                  ),
                  8.h(),
                  Text("${item["label"]}", style: const TextStyle(fontSize: 12)),
                  4.h(),
                  "${item["value"]}".ds(context)
                ],
              ));
          }
        ),
        18.h(),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 2.5
          ), 
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (_, idx){
            var item = analytics[idx+2];
            return StyledWrapper(
              p: const EdgeInsets.all(8),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: (item["color"] as Color).withOpacity(0.1),
                    child: item["icon"],
                  ),
                  8.w(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${item["label"]}", style: const TextStyle(fontSize: 12)),
                        4.h(),
                        "${item["value"]}".tl(context)
                      ],
                    ),
                  )
                ],
              ));
          }
        ),
        18.h(),
        StyledWrapper(
          p: const EdgeInsets.all(16),
          child: LineChart(
            title: "Click Performance",
            data: chartData
          ),
        )
      ],
    );
  }
}