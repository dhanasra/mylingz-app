import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/pages/links/create/create_link_viewmodel.dart';
import 'package:mylingz_app/widgets/styled_button.dart';

import '../../../constants/admob_const.dart';
import '../../../constants/string_const.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/validator.dart';
import '../bloc/links_bloc.dart';

class CreateLinkView extends StatefulWidget {
  final ShortLink? link;
  const CreateLinkView({super.key, this.link});

  @override
  State<CreateLinkView> createState() => _CreateLinkViewState();
}

class _CreateLinkViewState extends State<CreateLinkView> {
  late CreateLinkViewModel _viewModel;

  @override
  void initState() {
    _viewModel = CreateLinkViewModel(widget.link);
    super.initState();
    adLoaded();
  }

  adLoaded()async{

    InterstitialAd.load(
      adUnitId: AdmobConst.interstitialAdTest, 
      request: const AdRequest(), 
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad){
          _viewModel.interstitialAd = ad;
          _viewModel.isInterstitialAdLoaded = true;
        }, 
        onAdFailedToLoad: (error){
          _viewModel.interstitialAd?.dispose();
          _viewModel.isInterstitialAdLoaded = false;
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LinksBloc, LinksState>(
      listener: (context, state) {
        if(state is Success){
          context.goto(Routes.home, clear: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text( _viewModel.link!=null ? "Edit": StringConst.create).tr(),
        ),
        body: ValueListenableBuilder(
          valueListenable: _viewModel.mode,
          builder: (_, value, __) {
            return Form(
              key: _viewModel.formkey,
              autovalidateMode: value,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
                children: [
                  StringConst.destUrlLabel.ts(context),
                  8.h(),
                  TextFormField(
                    controller: _viewModel.destController,
                    validator: (v) => Validator.validateNonNullOrEmpty(v, "Url"),
                    decoration:
                        InputDecoration(hintText: StringConst.destUrlHint.tr()),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  12.h(),
                  "Title".ts(context),
                  8.h(),
                  TextFormField(
                    controller: _viewModel.titleController,
                    decoration: InputDecoration(hintText: "Enter Title".tr()),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  12.h(),
                  "Custom Back Half".ts(context),
                  8.h(),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          initialValue: "lingz.com",
                          enabled: false,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      12.w(),
                      "/".tl(context),
                      12.w(),
                      Expanded(
                        flex: 6,
                        child: ValueListenableBuilder(
                          valueListenable: _viewModel.availability,
                          builder: (_, val, __) {
                            return TextFormField(
                              enabled: _viewModel.link==null,
                              controller: _viewModel.backHalfController,
                              onChanged: (e)=>_viewModel.checkAvailability(e),
                              decoration: InputDecoration(
                                hintText: "Enter back half".tr(),
                                suffixIcon: val==null
                                ? SizedBox.shrink(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                    width: 16, height: 16,
                                    margin: const EdgeInsets.only(right: 12),
                                    child: const CircularProgressIndicator(strokeWidth: 2,)),
                                  ),
                                )
                                : val 
                                  ? const Icon(Icons.check, color: Colors.green)  
                                  : const Icon(Icons.close, color: Colors.red)  
                              ),
                              style: Theme.of(context).textTheme.titleMedium,
                            );
                          }
                        ),
                      )
                    ],
                  ),
                  12.h(),
                  Divider(
                    color: context.theme().colorScheme.background,
                  ),
                  ListTile(
                    title: "Use This Link In Bio"
                        .ts(context, color: context.theme().primaryColor, align: TextAlign.end),
                    trailing: Checkbox(
                      value: _viewModel.isBioLink,
                      onChanged: (v) {
                        setState(() {
                          _viewModel.isBioLink = v!;
                        });
                      },
                    ),
                    contentPadding: const EdgeInsets.only(left: 4),
                  ),
                  Visibility(
                    visible: _viewModel.isBioLink,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: context.theme().colorScheme.background),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Link-In-Bio Button Label".ts(context),
                          8.h(),
                          TextFormField(
                            controller: _viewModel.btnLableController,
                            validator: (v) =>
                                Validator.validateNonNullOrEmpty(v, "Url"),
                            decoration: InputDecoration(
                                hintText: "Enter Title".tr(),
                                helperText:
                                    "You can add this link to multiple Link-in-bios later."),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  34.h(),
                  StyledButton(onClick: ()=>_viewModel.showAd(context), text: (_viewModel.link!=null ? "Save": StringConst.create).toUpperCase())
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
