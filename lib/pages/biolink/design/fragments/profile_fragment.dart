// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/profile_design.dart';
import 'package:mylingz_app/pages/biolink/design/biolink_design_viewmodel.dart';
import 'package:mylingz_app/widgets/alignment_picker.dart';
import 'package:mylingz_app/widgets/layout_picker.dart';
import 'package:mylingz_app/widgets/slide_picker.dart';

import '../../../../utils/utils.dart';
import '../../../../widgets/color_picker.dart';

class ProfileFragment extends StatelessWidget {
  final BioLinkDesignViewModel vm;
  const ProfileFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Layout".ts(context),
        12.h(),
        LayoutPicker(
          type: vm.design.value.profileDesign?.layout,
          onChanged: (v){
            var design = vm.design.value;
            vm.design.value = design.copyWith(
              profileDesign: design.profileDesign
                ?.copyWith(layout: v) ?? ProfileDesign(layout: v)
            );
            vm.design.notifyListeners();
          }),
        20.h(),
        "Alignment".ts(context),
        12.h(),
        AlignmentPicker(
          type: vm.design.value.profileDesign?.alignment,
          onChanged: (v){
            var design = vm.design.value;
            vm.design.value = design.copyWith(
              profileDesign: design.profileDesign
                ?.copyWith(alignment: v) ?? ProfileDesign(alignment: v)
            );
            vm.design.notifyListeners();
          }
        ),
        20.h(),
        "Size".ts(context),
        12.h(),
        SlidePicker(
          value: vm.design.value.profileDesign?.size,
          icon: Icons.add_box_outlined,
          onChanged: (v){
            var design = vm.design.value;
            vm.design.value = design.copyWith(
              profileDesign: design.profileDesign
                ?.copyWith(size: v) ?? ProfileDesign(size: v)
            );
            vm.design.notifyListeners();
          }),
        20.h(),
        "Corner".ts(context),
        12.h(),
        SlidePicker(
          value: vm.design.value.profileDesign?.corner,
          icon: Icons.border_style_sharp,
          onChanged: (v){
            var design = vm.design.value;
            vm.design.value = design.copyWith(
              profileDesign: design.profileDesign
                ?.copyWith(corner: v) ?? ProfileDesign(corner: v)
            );
            vm.design.notifyListeners();
          }),
        20.h(),
        "Title".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.wrapper?.borderColor),
          onChanged: (e){
            if(e!=null){
              var design = vm.design.value;
              vm.design.value = design.copyWith(
                profileDesign: design.profileDesign?.copyWith(titleColor: colorToString(e))
                  ?? ProfileDesign(titleColor: colorToString(e))
              );
              vm.design.notifyListeners();
            }
          },
        ),
        20.h(),
        "Slogan".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.wrapper?.borderColor),
          onChanged: (e){
            if(e!=null){
              var design = vm.design.value;
              vm.design.value = design.copyWith(
                profileDesign: design.profileDesign?.copyWith(sloganColor: colorToString(e))
                  ?? ProfileDesign(sloganColor: colorToString(e))
              );
              vm.design.notifyListeners();
            }
          },
        )
      ],
    );
  }
}