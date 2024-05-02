// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/network/models/social_link.dart';
import 'package:mylingz_app/pages/biolink/social_icons/bottomsheets/icons_lib_view.dart';

import '../../../network/models/bio_link.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/global.dart';

class SocialIconsViewModel extends BaseViewModel{
  late BioLink bioLink;

  late GlobalKey<FormState> formkey;
  late TextEditingController labelController;
  late TextEditingController urlController;
  late ValueNotifier<AutovalidateMode> mode;
  late ValueNotifier<List<SocialLink>> icons;

  SocialIconsViewModel(){
    formkey = GlobalKey();
    bioLink = Global.bioLink.value!;
    labelController = TextEditingController();
    urlController = TextEditingController();
    mode = ValueNotifier(AutovalidateMode.disabled);
    icons = ValueNotifier(Global.bioLink.value?.icons??[]);
  }

  addSocialLink(BuildContext context){
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_){ 
        return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
            margin: const EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              color: context.theme().scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24))
            ),
            padding: const EdgeInsets.all(20),
            child: IconsLibView(
              onClick: (item){
                context.goto(Routes.iconsCreate, args: item).then(
                  (link){
                    if(link!=null){
                      icons.value.add(link);
                      icons.notifyListeners();
                    }
                  });
              },
            )
        ));
      }
    );
  }
  
  reOrderList(oldIndex, newIndex){
    final SocialLink item = icons.value.removeAt(oldIndex);
    icons.value.insert(newIndex, item);
    icons.notifyListeners();
  }

  @override
  dispose() {

  }
}