import 'package:flutter/material.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/block_fragment.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/profile_fragment.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/theme_fragment.dart';
import 'package:mylingz_app/widgets/biolink_design_preview.dart';

class BioLinkDesignView extends StatefulWidget {
  const BioLinkDesignView({super.key});

  @override
  State<BioLinkDesignView> createState() => _BioLinkDesignViewState();
}

class _BioLinkDesignViewState extends State<BioLinkDesignView> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
                    Expanded(
                      child: ListView(
                        children: const [
                          BioLinkDesignPreview()
                        ],
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.check))
                  ],
                ),
              ),
              const TabBar(tabs: [
                Tab(text: "Theme"),
                Tab(text: "Block"),
                Tab(text: "Profile")
              ]),
              const Expanded(
                flex: 4,
                child: TabBarView(
                  children: [
                    ThemeFragment(),
                    BlockFragment(),
                    ProfileFragment()
                  ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}