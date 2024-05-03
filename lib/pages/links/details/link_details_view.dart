import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:like_button/like_button.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/links/bloc/links_bloc.dart';
import 'package:mylingz_app/pages/links/details/link_details_viewmodel.dart';
import 'package:mylingz_app/routes/app_routes.dart';
import 'package:mylingz_app/widgets/line_chart.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';
import 'package:share_plus/share_plus.dart';

class LinkDetailsView extends StatefulWidget {
  final String linkId;
  const LinkDetailsView({super.key, required this.linkId});

  @override
  State<LinkDetailsView> createState() => _LinkDetailsViewState();
}

class _LinkDetailsViewState extends State<LinkDetailsView> {
  late LinkDetailsViewModel _viewModel;

  @override
  void initState() {
    _viewModel = LinkDetailsViewModel(widget.linkId, context);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LinksBloc, LinksState>(
      listener: (context, state) {
        if (state is Deleted) {
          context.goto(Routes.home, clear: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            LikeButton(
              isLiked: true,
              onTap: (isLiked) async {
                return !isLiked;
              },
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.deepOrange : Colors.grey,
                );
              },
            ),
            16.w(),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            StyledWrapper(
                p: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _viewModel.shortLink.title?.hm(context),
                    "${_viewModel.shortLink.domain.removeHttps()}/${_viewModel.shortLink.short}"
                        .ts(context),
                    16.h(),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(
                            "${_viewModel.shortLink.domain}/${_viewModel.shortLink.short}"));
                      },
                      child: DottedBorder(
                          color: const Color(0xFF0000FF),
                          radius: const Radius.circular(4),
                          borderType: BorderType.RRect,
                          child: Container(
                            color: context.theme().colorScheme.background,
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Expanded(
                                  child:
                                      "${_viewModel.shortLink.domain.removeHttps()}/${_viewModel.shortLink.short}"
                                          .tl(context, isLink: true),
                                ),
                                const Icon(Icons.open_in_new,
                                    color: Color(0xFF0000FF), size: 20)
                              ],
                            ),
                          )),
                    ),
                    16.h(),
                    Row(
                        children: _viewModel.options
                            .map((e) => Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      if (e["id"] == "edit") {
                                        context.goto(Routes.createLink,
                                            args: _viewModel.shortLink);
                                      } else if (e["id"] == "copy") {
                                        Clipboard.setData(ClipboardData(
                                            text:
                                                "${_viewModel.shortLink.domain}/${_viewModel.shortLink.short}"));
                                      } else if (e["id"] == "share") {
                                        Share.share(
                                            "${_viewModel.shortLink.domain}/${_viewModel.shortLink.short}");
                                      } else if (e["id"] == "remove") {
                                        context.read<LinksBloc>().add(
                                            RemoveLinkEvent(
                                                id: _viewModel.shortLink.id));
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(0.4)),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Icon(
                                            e["icon"],
                                            size: 16,
                                          ),
                                        ),
                                        4.h(),
                                        Text(e["label"],
                                            style:
                                                const TextStyle(fontSize: 12))
                                      ],
                                    ),
                                  ),
                                ))
                            .toList())
                  ],
                )),
            26.h(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: "Analytics".hm(context),
            ),
            18.h(),
            BlocBuilder<LinksBloc, LinksState>(
              builder: (context, state) {

                if(state is AnalyticsFetched){
                  _viewModel.setupStatistics(state);
                }
                
                return Column(
                  children: [
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 2.5),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _viewModel.analytics.length,
                        itemBuilder: (_, idx) {
                          var item = _viewModel.analytics[idx];
                          return StyledWrapper(
                              p: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: (item["color"] as Color)
                                        .withOpacity(0.1),
                                    child: item["icon"],
                                  ),
                                  8.w(),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("${item["label"]}",
                                            style:
                                                const TextStyle(fontSize: 12)),
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
                        title: "Click Performance",
                        data: _viewModel.chartData,
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
