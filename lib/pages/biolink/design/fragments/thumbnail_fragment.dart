// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/thumbnail.dart';
import 'package:mylingz_app/pages/biolink/design/biolink_design_viewmodel.dart';
import 'package:mylingz_app/widgets/icon_type_picker.dart';

class ThumbnailFragment extends StatelessWidget {
  final BioLinkDesignViewModel vm;
  const ThumbnailFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Icon Type".ts(context),
        12.h(),
        IconTypePicker(
          type: vm.design.value.thumbnail?.style,
          onChanged: (e){
            var design = vm.design.value;
            vm.design.value = design.copyWith(
              thumbnail: design.thumbnail?.copyWith(
                style: e
              ) ?? Thumbnail(style: e)
            );
            vm.design.notifyListeners();
          })
      ],
    );
  }
}