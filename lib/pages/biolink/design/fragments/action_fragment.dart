// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/action_btn_style.dart';
import 'package:mylingz_app/pages/biolink/design/biolink_design_viewmodel.dart';
import 'package:mylingz_app/utils/utils.dart';

import '../../../../widgets/color_picker.dart';

class ActionFragment extends StatelessWidget {
  final BioLinkDesignViewModel vm;
  const ActionFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Text".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.actionBtnStyle?.color),
          onChanged: (e){
            if(e!=null){
              var design = vm.design.value;
              vm.design.value = design.copyWith(
                actionBtnStyle: design.actionBtnStyle?.copyWith(
                  color: colorToString(e)
                )?? ActionBtnStyle(color: colorToString(e))
              );
              vm.design.notifyListeners();
            }
          },
        ),
        20.h(),
        "Background".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.actionBtnStyle?.bgColor),
          onChanged: (e){
            if(e!=null){
              var design = vm.design.value;
              vm.design.value = design.copyWith(
                actionBtnStyle: design.actionBtnStyle?.copyWith(
                  bgColor: colorToString(e)
                )?? ActionBtnStyle(bgColor: colorToString(e))
              );
              vm.design.notifyListeners();
            }
          },
        ),
        20.h(),
        "Border".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.actionBtnStyle?.borderColor),
          onChanged: (e){
            if(e!=null){
              var design = vm.design.value;
              vm.design.value = design.copyWith(
                actionBtnStyle: design.actionBtnStyle?.copyWith(
                  borderColor: colorToString(e)
                )?? ActionBtnStyle(borderColor: colorToString(e))
              );
              vm.design.notifyListeners();
            }
          },
        ),
      ],
    );
  }
}