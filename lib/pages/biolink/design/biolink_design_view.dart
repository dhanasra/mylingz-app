import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/pages/biolink/design/biolink_design_viewmodel.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/block_fragment.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/profile_fragment.dart';
import 'package:mylingz_app/pages/biolink/design/fragments/theme_fragment.dart';
import 'package:mylingz_app/utils/toast.dart';
import 'package:mylingz_app/widgets/biolink_design_preview.dart';

import '../../../constants/admob_const.dart';
import '../bloc/bio_link_bloc.dart';

class BioLinkDesignView extends StatefulWidget {
  const BioLinkDesignView({super.key});

  @override
  State<BioLinkDesignView> createState() => _BioLinkDesignViewState();
}

class _BioLinkDesignViewState extends State<BioLinkDesignView> {
  late BioLinkDesignViewModel _viewModel;
  BannerAd? _bannerAd;

  @override
  void initState() {
    _viewModel = BioLinkDesignViewModel();

     BannerAd(
      size: AdSize.banner, 
      adUnitId: AdmobConst.bannerAdTest, 
      listener: BannerAdListener(
        onAdLoaded: (ad){
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error){
          ad.dispose();
        }
      ), 
      request: const AdRequest()
    ).load();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BioLinkBloc, BioLinkState>(
      listener: (context, state) {
        if(state is Success){
          Toast.show(context, message: "Page design updated successfully!", type: "success");
          context.back();
        }
      },
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () => context.back(),
                          icon: const Icon(Icons.arrow_back)),
                      Expanded(
                        child: ListView(
                          children: [
                            ValueListenableBuilder(
                                valueListenable: _viewModel.design,
                                builder: (_, val, __) {
                                  return BioLinkDesignPreview(design: val);
                                })
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () => _viewModel.saveDesign(context),
                          icon: const Icon(Icons.check))
                    ],
                  ),
                ),

                if(_bannerAd!=null)
                  SizedBox(
                    height: _bannerAd!.size.height.toDouble(),
                    width: _bannerAd!.size.width.toDouble(),
                    child: AdWidget(
                      ad: _bannerAd!
                    ),
                  ),

                
                const TabBar(tabs: [
                  Tab(text: "Theme"),
                  Tab(text: "Block"),
                  Tab(text: "Profile")
                ]),
                Expanded(
                  flex: 6,
                  child: TabBarView(children: [
                    ThemeFragment(vm: _viewModel),
                    BlockFragment(vm: _viewModel),
                    ProfileFragment(vm: _viewModel)
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
