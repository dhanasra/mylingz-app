import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/widgets/font_picker.dart';
import 'package:mylingz_app/widgets/wrapper_type_picker.dart';

import '../../../../widgets/color_picker.dart';

class ThemeFragment extends StatelessWidget {
  const ThemeFragment({super.key});

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
            
          }),
        20.h(),
        "Text".ts(context),
        12.h(),
        ColorPicker(
          onChanged: (e){
            if(e!=null){

            }
          },
        ),
      ],
    );
  }
}