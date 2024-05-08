import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/widgets/icon_type_picker.dart';

class ThumbnailFragment extends StatelessWidget {
  const ThumbnailFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Icon Type".ts(context),
        12.h(),
        IconTypePicker(
          onChanged: (e){
            
          })
      ],
    );
  }
}