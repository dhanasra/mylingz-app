import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

class BottomsheetClose extends StatelessWidget {
  const BottomsheetClose({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: const ImageIcon(AssetImage('res/images/close.png'), size: 40, color: Colors.white)),
          8.h(),
          "CLOSE".bs(context, color: Colors.white)
        ],
      ));
  }
}