import 'package:flutter/material.dart';
import 'package:mylingz_app/pages/biolink/design/biolink_design_viewmodel.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/action_fragment.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/color_fragment.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/style_fragment.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/thumbnail_fragment.dart';

class BlockFragment extends StatelessWidget {
  final BioLinkDesignViewModel vm;
  const BlockFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: [
            Tab(text: "Style"),
            Tab(text: "Color"),
            Tab(text: "Thumbnail"),
            Tab(text: "Action"),
          ]),
          Expanded(
            child: TabBarView(
              children: [
                StyleFragment(vm: vm),
                ColorFragment(vm: vm),
                ThumbnailFragment(vm: vm),
                ActionFragment(vm: vm)
              ]),
          )
        ],
      ),
    );
  }
}