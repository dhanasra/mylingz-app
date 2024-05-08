import 'package:flutter/material.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/action_fragment.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/color_fragment.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/style_fragment.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/thumbnail_fragment.dart';

class BlockFragment extends StatelessWidget {
  const BlockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
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
                StyleFragment(),
                ColorFragment(),
                ThumbnailFragment(),
                ActionFragment()
              ]),
          )
        ],
      ),
    );
  }
}