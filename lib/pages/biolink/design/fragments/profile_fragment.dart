import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/widgets/alignment_picker.dart';
import 'package:mylingz_app/widgets/layout_picker.dart';
import 'package:mylingz_app/widgets/slide_picker.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Layout".ts(context),
        12.h(),
        LayoutPicker(onChanged: (v){}),
        20.h(),
        "Alignment".ts(context),
        12.h(),
        AlignmentPicker(onChanged: (v){}),
        20.h(),
        "Size".ts(context),
        12.h(),
        SlidePicker(
          icon: Icons.add_box_outlined,
          onChanged: (v){}),
        20.h(),
        "Corner".ts(context),
        12.h(),
        SlidePicker(
          icon: Icons.border_style_sharp,
          onChanged: (v){})
      ],
    );
  }
}