// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/contact_fields.dart';
import 'package:mylingz_app/pages/biolink/contact_fields/fragments/create_field_fragment.dart';
import 'package:mylingz_app/utils/utils.dart';

import '../../../network/models/bio_link.dart';
import '../../../utils/global.dart';

class ContactFieldsViewModel extends BaseViewModel {
  late BioLink bioLink;

  late GlobalKey<FormState> formkey;
  late TextEditingController titleController;
  late ValueNotifier<bool> isRequired;
  late ValueNotifier<AutovalidateMode> mode;
  late ValueNotifier<List<ContactFields>> fields;

  ContactFieldsViewModel(){
    formkey = GlobalKey();
    bioLink = Global.bioLink.value!;
    titleController = TextEditingController();
    isRequired = ValueNotifier(true);
    mode = ValueNotifier(AutovalidateMode.disabled);
    fields = ValueNotifier(Global.bioLink.value?.contactFields??[]);
  }

  openLinkEditor(BuildContext context, { ContactFields? field }){

    titleController.text = field?.label??'';
    isRequired.value = field?.required??true;
    mode.value = AutovalidateMode.disabled;

    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_){ 
        return CreateFieldFragment(
          vm: this,
          field: field
        );
      }
    );
  }

  reOrderList(oldIndex, newIndex){
    final ContactFields item = fields.value.removeAt(oldIndex);
    fields.value.insert(newIndex, item.copyWith(idx: newIndex));
    fields.notifyListeners();
  }


  saveField(BuildContext context){
    fields.value.add(
      ContactFields(
        idx: fields.value.length, 
        id: generateUniqueString(), 
        label: titleController.trim(), 
        required: isRequired.value
      )
    );
    fields.notifyListeners();
    context.back();
  }

  editField(BuildContext context, String id){
    fields.value = fields.value.map((e){
      if(e.id==id){
        return ContactFields(
          idx: fields.value.indexOf(e), 
          id: id, 
          label: titleController.trim(), 
          required: isRequired.value
        );
      }else{
        return e;
      }
    }).toList();
    fields.notifyListeners();
    context.back();
  }

  removeField(BuildContext context, String id){
    fields.value = fields.value.where((e)=>e.id!=id).toList();
    fields.notifyListeners();
    context.back();
  }
  
  @override
  dispose() {

  }
}