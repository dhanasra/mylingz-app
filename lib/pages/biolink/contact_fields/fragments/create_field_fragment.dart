import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/contact_fields.dart';
import 'package:mylingz_app/pages/biolink/contact_fields/contact_fields_viewmodel.dart';
import 'package:mylingz_app/widgets/styled_button.dart';

import '../../../../constants/color_const.dart';
import '../../../../utils/validator.dart';

class CreateFieldFragment extends StatelessWidget {
  final ContactFields? field;
  final ContactFieldsViewModel vm;
  const CreateFieldFragment({super.key, this.field, required this.vm});

  @override
  Widget build(BuildContext context) {

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
      child: ValueListenableBuilder(
        valueListenable: vm.mode,
        builder: (_, val, __) {
          return Form(
            key: vm.formkey,
            autovalidateMode: val,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                AppBar(
                  centerTitle: false,
                  title: Text("${field!=null ? "Edit": "Create"} Field"),
                  backgroundColor: Colors.transparent,
                  actions: [
                    Visibility(
                      visible: field!=null,
                      child: IconButton(
                        onPressed: ()=>vm.removeField(context, field!.id), 
                        icon: const Icon(Icons.delete_outline_outlined, color: Colors.red)),
                    ),
                    4.w()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.h(),
                      "Field Title".ts(context),
                      8.h(),  
                      TextFormField(
                        controller: vm.titleController,
                        validator: (v) =>
                            Validator.validateNonNullOrEmpty(v, "Field Title"),
                        decoration:
                            InputDecoration(
                              prefixIcon: const Icon(Icons.smart_button_rounded),
                              hintText: "Enter field title".tr()),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      12.h(),
                      ValueListenableBuilder(
                        valueListenable: vm.isRequired,
                        builder: (_, val, __){
                          return ListTile(
                            title: "Required Field"
                                .ts(context, color: ColorConst.primary, align: TextAlign.end),
                            trailing: Checkbox(
                              value: val,
                              onChanged: (v) {
                                vm.isRequired.value = v!;
                              },
                            ),
                            contentPadding: const EdgeInsets.only(left: 4),
                          );
                        }
                      ),
                      16.h(),
                      StyledButton(
                        onClick: (){
                          if(!vm.formkey.currentState!.validate()){
                            vm.mode.value = AutovalidateMode.always;
                            return;
                          }
                          if(field==null){
                            vm.saveField(context);
                          }else{
                            vm.editField(context, field!.id);
                          }
                        }, 
                        text: "SAVE"
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    ));
  }
}