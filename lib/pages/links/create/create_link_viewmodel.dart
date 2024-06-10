import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/constants/url_const.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/firebase_client.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/pages/links/bloc/links_bloc.dart';
import 'package:mylingz_app/utils/toast.dart';
import 'package:mylingz_app/utils/utils.dart';

class CreateLinkViewModel extends BaseViewModel {

  final GlobalKey<FormState> formkey = GlobalKey();
  
  late TextEditingController destController;
  late TextEditingController titleController;
  late TextEditingController backHalfController;
  bool isBioLink = false;
  late TextEditingController btnLableController;

  late ValueNotifier<AutovalidateMode> mode;
  late ValueNotifier<bool?> availability;

  ShortLink? link;
  bool? availabilityChecking;

  CreateLinkViewModel(this.link){

    destController = TextEditingController(text: link?.url);
    titleController = TextEditingController(text: link?.title);
    backHalfController = TextEditingController(text: link?.short ?? generateUniqueString());
    isBioLink = link?.bioLink ?? false;
    btnLableController = TextEditingController(text: link?.bioLinkBtnLabel);
    mode = ValueNotifier(AutovalidateMode.disabled);
    availability = ValueNotifier(true);
  }

  InterstitialAd? interstitialAd;
  bool isInterstitialAdLoaded = false;

  showAd(BuildContext context){

    if(availability.value==null){
      return;
    }else if(!availability.value!){
      Toast.show(context, message: "Back half link is not available", type: "error");
      return;
    }

    if(!formkey.currentState!.validate()){
      mode.value = AutovalidateMode.always;
      return;
    }

    if(isInterstitialAdLoaded && interstitialAd!=null ){
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          save(context);
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          save(context);
          isInterstitialAdLoaded = false;
        },
      );
      interstitialAd!.show();
      return;
    }
    save(context);
  }

  save(BuildContext context){

    context.read<LinksBloc>().add(
      SaveLinkEvent(
        url: destController.trim(), 
        title: titleController.trimNull(), 
        short: backHalfController.trim(), 
        domain: UrlConst.domainName, 
        isBioLink: isBioLink,
        btnLabel: btnLableController.trimNull(),
        id: link?.id
      )
    );
  }

  checkAvailability(e)async{
    availability.value = null;
    QuerySnapshot querySnapshot = await FirebaseClient().linksDB.where("short", isEqualTo: e).limit(1).get();
    if(querySnapshot.docs.isNotEmpty){
      availability.value = false;
    }else{
      availability.value = true;
    }
  }
  
  @override
  dispose() {

  }

}