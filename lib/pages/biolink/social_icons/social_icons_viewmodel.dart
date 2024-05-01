// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/network/models/social_link.dart';

import '../../../network/models/bio_link.dart';
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
  
  reOrderList(oldIndex, newIndex){
    final SocialLink item = icons.value.removeAt(oldIndex);
    icons.value.insert(newIndex, item);
    icons.notifyListeners();
  }

  @override
  dispose() {

  }
}