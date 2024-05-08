import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/widgets/slide_picker.dart';

class StyleFragment extends StatelessWidget {
  const StyleFragment({super.key});

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
          onChanged: (e){
            
          }),
        20.h(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: "Outline".ts(context),  
        ),
        SlidePicker(
          icon: Icons.border_all,
          onChanged: (e){
            
          }),
      ],
    );
  }
}