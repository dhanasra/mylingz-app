// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/biolink/design/biolink_design_viewmodel.dart';
import 'package:mylingz_app/widgets/slide_picker.dart';

class StyleFragment extends StatelessWidget {
  final BioLinkDesignViewModel vm;
  const StyleFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        20.h(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: "Corner".ts(context),  
        ),
        SlidePicker(
          icon: Icons.border_style_sharp,
          value: vm.design.value.cornerRadius,
          onChanged: (e){
            vm.design.value = vm.design.value.copyWith(
              cornerRadius: e 
            );
            vm.design.notifyListeners();
          }),
        20.h(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: "Outline".ts(context),  
        ),
        SlidePicker(
          icon: Icons.border_all,
          value: vm.design.value.outline,
          onChanged: (e){
            vm.design.value = vm.design.value.copyWith(
              outline: e 
            );
            vm.design.notifyListeners();
          }),
      ],
    );
  }
}