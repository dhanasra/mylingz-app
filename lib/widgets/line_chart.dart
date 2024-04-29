import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/network/models/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  final String title;
  final List<ChartData> data;
  const LineChart({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        24.h(),
        SizedBox(
          height: 200,
          child: SfCartesianChart(
            primaryXAxis: const CategoryAxis(),
            margin: const EdgeInsets.all(0),
            tooltipBehavior: TooltipBehavior(),
            series: <LineSeries<ChartData, String>>[
              LineSeries<ChartData, String>(
                dataSource: data,
                xValueMapper: (ChartData sales, _) => sales.label,
                yValueMapper: (ChartData sales, _) => sales.value,
                dataLabelSettings: const DataLabelSettings(isVisible: true)
              )
            ]
          ),
        ),
      ],
    );  
  }
}