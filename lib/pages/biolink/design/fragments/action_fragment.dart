import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../../../../widgets/color_picker.dart';

class ActionFragment extends StatelessWidget {
  const ActionFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Text".ts(context),
        12.h(),
        ColorPicker(
          onChanged: (e){
            if(e!=null){

            }
          },
        ),
        20.h(),
        "Background".ts(context),
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