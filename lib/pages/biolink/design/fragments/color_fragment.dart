// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/wrapper.dart';
import 'package:mylingz_app/pages/biolink/design/biolink_design_viewmodel.dart';
import 'package:mylingz_app/utils/utils.dart';

import '../../../../widgets/color_picker.dart';

class ColorFragment extends StatelessWidget {
  final BioLinkDesignViewModel vm;
  const ColorFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Background".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.wrapper?.bgColor),
          onChanged: (e){
            if(e!=null){
              var design = vm.design.value;
              vm.design.value = design.copyWith(
                wrapper: design.wrapper?.copyWith(bgColor: colorToString(e))
                  ?? Wrapper(bgColor: colorToString(e))
              );
              vm.design.notifyListeners();
            }
          },
        ),
        20.h(),
        "Text".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.wrapper?.color),
          onChanged: (e){
            if(e!=null){
              var design = vm.design.value;
              vm.design.value = design.copyWith(
                wrapper: design.wrapper?.copyWith(color: colorToString(e))
                  ?? Wrapper(color: colorToString(e))
              );
              vm.design.notifyListeners();
            }
          },
        ),
        20.h(),
        "Outline".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.wrapper?.borderColor),
          onChanged: (e){
            if(e!=null){
              var design = vm.design.value;
              vm.design.value = design.copyWith(
                wrapper: design.wrapper?.copyWith(borderColor: colorToString(e))
                  ?? Wrapper(borderColor: colorToString(e))
              );
              vm.design.notifyListeners();
            }
          },
        )
      ],
    );
  }
}