import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/biolink/analytics/biolink_analytics_viewmodel.dart';

import '../../../widgets/line_chart.dart';
import '../../../widgets/styled_wrapper.dart';
import '../bloc/bio_link_bloc.dart';

class BioLinkAnalyticsView extends StatefulWidget {
  const BioLinkAnalyticsView({super.key});

  @override
  State<BioLinkAnalyticsView> createState() => _BioLinkAnalyticsViewState();
}

class _BioLinkAnalyticsViewState extends State<BioLinkAnalyticsView> {
  late BioLinkAnalyticsViewModel _viewModel;

  @override
  void initState() {
    _viewModel = BioLinkAnalyticsViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Analytics"),
      ),
      body: BlocBuilder<BioLinkBloc, BioLinkState>(
        builder: (context, state) {

          if(state is AnalyticsFetched){
            _viewModel.setupStatistics(state);
          }
          
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (_, idx) {
                    var item = _viewModel.analytics[idx];
                    return StyledWrapper(
                        p: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  (item["color"] as Color).withOpacity(0.1),
                              child: item["icon"],
                            ),
                            8.h(),
                            Text("${item["label"]}",
                                style: const TextStyle(fontSize: 12)),
                            4.h(),
                            "${item["value"]}".ds(context)
                          ],
                        ));
                  }),
              18.h(),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 2.5),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (_, idx) {
                    var item = _viewModel.analytics[idx + 2];
                    return StyledWrapper(
                        p: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  (item["color"] as Color).withOpacity(0.1),
                              child: item["icon"],
                            ),
                            8.w(),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${item["label"]}",
                                      style: const TextStyle(fontSize: 12)),
                                  4.h(),
                                  "${item["value"]}".tl(context)
                                ],
                              ),
                            )
                          ],
                        ));
                  }),
              18.h(),
              StyledWrapper(
                p: const EdgeInsets.all(16),
                child: LineChart(
                    title: "Click Performance", data: _viewModel.chartData),
              )
            ],
          );
        },
      ),
    );
  }
}
