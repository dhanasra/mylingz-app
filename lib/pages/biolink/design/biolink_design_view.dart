import 'package:flutter/material.dart';
import 'package:mylingz_app/pages/biolink/design/biolink_design_viewmodel.dart';
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
  late BioLinkDesignViewModel _viewModel;

  @override
  void initState() {
    _viewModel = BioLinkDesignViewModel();
    super.initState();
  }

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
                        children: [
                          ValueListenableBuilder(
                            valueListenable: _viewModel.design,
                            builder: (_, val, __) {
                              return BioLinkDesignPreview(design: val);
                            }
                          )
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
              Expanded(
                flex: 4,
                child: TabBarView(
                  children: [
                    ThemeFragment(vm: _viewModel),
                    BlockFragment(vm: _viewModel),
                    ProfileFragment(vm: _viewModel)
                  ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}