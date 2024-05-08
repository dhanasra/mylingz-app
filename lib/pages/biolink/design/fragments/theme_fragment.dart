// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/biolink/design/biolink_design_viewmodel.dart';
import 'package:mylingz_app/utils/utils.dart';
import 'package:mylingz_app/widgets/font_picker.dart';
import 'package:mylingz_app/widgets/wrapper_type_picker.dart';

import '../../../../widgets/color_picker.dart';

class ThemeFragment extends StatelessWidget {
  final BioLinkDesignViewModel vm;
  const ThemeFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        WrapperTypePicker(
          onChanged: (e)=>{},
        ),
        20.h(),
        "Font".ts(context),
        12.h(),
        FontPicker(
          onChanged: (e){
            vm.design.value = vm.design.value.copyWith(
              font: e["name"]
            );
            vm.design.notifyListeners();
          }),
        20.h(),
        "Text".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.color),
          onChanged: (e){
            if(e!=null){
              vm.design.value = vm.design.value.copyWith(color: colorToString(e));
              vm.design.notifyListeners();
            }
          },
        ),
      ],
    );
  }
}