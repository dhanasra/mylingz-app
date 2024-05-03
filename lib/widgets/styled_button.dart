import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/color_const.dart';

class StyledButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  final double? w;
  final bool rounded;
  final bool outlined;
  final bool loading;
  final bool secondary;
  const StyledButton({super.key, this.loading = false, required this.onClick, required this.text, this.w, this.rounded = false, this.secondary = false, this.outlined = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: w,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(rounded? 30: 8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: secondary
            ? [
              ColorConst.primaryLight,
              const Color.fromARGB(255, 140, 128, 207),
              ColorConst.primaryLight,
             
            ] 
            : [
               const Color(0xFF2B275A),
              const Color(0xFF5C55AB),
              const Color(0xFF2B275A)
            ]
          )
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: outlined ? 0 : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(rounded? 30: 6),
            ),
            backgroundColor: outlined ? Colors.white: Colors.transparent),
          onPressed: onClick, 
          child: loading
          ? const SizedBox(
            width: 24, height: 24,
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
          : Text(text, style: TextStyle(
            color: outlined ? ColorConst.primary: Colors.white
          )).tr()
        )
    );
  }
}