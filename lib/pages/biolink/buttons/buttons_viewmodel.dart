// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/network/models/bio_link.dart';
import 'package:mylingz_app/network/models/bio_link_button.dart';
import 'package:mylingz_app/pages/biolink/buttons/fragments/create_button_fragment.dart';
import 'package:mylingz_app/utils/global.dart';
import 'package:mylingz_app/utils/utils.dart';

class ButtonsViewModel extends BaseViewModel {
  late BioLink bioLink;

  late GlobalKey<FormState> formkey;
  late TextEditingController labelController;
  late TextEditingController urlController;
  late ValueNotifier<BioLinkButton> btnPreview;
  late ValueNotifier<AutovalidateMode> mode;
  late ValueNotifier<List<BioLinkButton>> buttons;

  ButtonsViewModel(){
    formkey = GlobalKey();
    bioLink = Global.bioLink.value!;
    labelController = TextEditingController();
    urlController = TextEditingController();
    btnPreview = ValueNotifier(
      BioLinkButton(idx: 0, id: "", text: "", url: ""));
    mode = ValueNotifier(AutovalidateMode.disabled);
    buttons = ValueNotifier(Global.bioLink.value?.buttons??[]);
  }
  
  openLinkEditor(BuildContext context, { BioLinkButton? btn }){

    labelController.text = btn?.text??'';
    urlController.text = btn?.url??'';
    btnPreview.value = btn ?? BioLinkButton(
      idx: 0, id: generateUniqueString(), text: "", url: "", btnAnimation: 0);
    mode.value = AutovalidateMode.disabled;

    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_){ 
        return CreateButtonFragment(
          vm: this,
          button: btn,
        );
      }
    );
  }

  reOrderList(oldIndex, newIndex){
    final BioLinkButton item = buttons.value.removeAt(oldIndex);
    buttons.value.insert(newIndex, item.copyWith(idx: newIndex));
    buttons.notifyListeners();
  }

  saveButton(BuildContext context){
    buttons.value.add(btnPreview.value);
    buttons.notifyListeners();
    context.back();
  }

  editButton(BuildContext context){
    buttons.value = buttons.value.map((e){
      if(e.id==btnPreview.value.id){
        return btnPreview.value;
      }else{
        return e;
      }
    }).toList();
    buttons.notifyListeners();
    context.back();
  }

  removeButton(BuildContext context){
    buttons.value = buttons.value.where((e)=>e.id!=btnPreview.value.id).toList();
    buttons.notifyListeners();
    context.back();
  }

  updateSwitch(String id, bool enabled){
    BioLinkButton filtered = buttons.value.firstWhere((e)=>e.id==id);
    var updated = filtered.copyWith(enabled: enabled);
    buttons.value = buttons.value.map((e){
      if(e.id==id){
        return updated;
      }else{
        return e;
      }
    }).toList(); 
  }

  @override
  dispose() {

  }

}