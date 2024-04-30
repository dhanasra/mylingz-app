import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/bio_link_button.dart';
import 'package:mylingz_app/pages/biolink/buttons/buttons_viewmodel.dart';
import 'package:mylingz_app/widgets/styled_button.dart';

import '../../../../utils/validator.dart';

class CreateButtonFragment extends StatelessWidget {
  final BioLinkButton? button;
  final ButtonsViewModel vm;
  const CreateButtonFragment({super.key, this.button, required this.vm});

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
                  title: Text("${button!=null ? "Edit": "Create"} Button"),
                  backgroundColor: Colors.transparent,
                  actions: [
                    Visibility(
                      visible: button!=null,
                      child: IconButton(
                        onPressed: ()=>vm.removeButton(context), 
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
                      "Button Preview".ts(context),
                      8.h(),
                      ValueListenableBuilder(
                        valueListenable: vm.btnPreview,
                        builder: (_, val, __) {
                          return Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: context.theme().colorScheme.background,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: StyledButton(
                              onClick: (){}, 
                              secondary: true,
                              text: (val.text).trim()
                            ),
                          );
                        }
                      ),
                      12.h(),
                      "Button Label".ts(context),
                      8.h(),  
                      TextFormField(
                        controller: vm.labelController,
                        onChanged: (e){
                          var newBtn = vm.btnPreview.value.copyWith(text: e);
                          vm.btnPreview.value = newBtn;
                        },
                        validator: (v) =>
                            Validator.validateNonNullOrEmpty(v, "Button label"),
                        decoration:
                            InputDecoration(
                              prefixIcon: const Icon(Icons.smart_button_rounded),
                              hintText: "Enter button label".tr()),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      12.h(),
                      "Destination Url".ts(context),
                      8.h(),
                      TextFormField(
                        controller: vm.urlController,
                        validator: (v) =>
                            Validator.isValidURL(v, "Url"),
                        onChanged: (e){
                          var newBtn = vm.btnPreview.value.copyWith(url: e);
                          vm.btnPreview.value = newBtn;
                        },
                        decoration:
                            InputDecoration(
                              prefixIcon: const Icon(Icons.link_outlined),
                              hintText: "Enter destination url".tr()),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      32.h(),
                      StyledButton(
                        onClick: (){
                          if(!vm.formkey.currentState!.validate()){
                            vm.mode.value = AutovalidateMode.always;
                            return;
                          }
                          if(button==null){
                            vm.saveButton(context);
                          }else{
                            vm.editButton(context);
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