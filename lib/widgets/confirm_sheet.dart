import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import 'dialog_wrapper.dart';
import 'styled_button.dart';

class ConfirmSheet extends StatelessWidget {
  final String icon;
  final String title;
  final String content;
  final VoidCallback onSuccess;
  const ConfirmSheet({super.key, required this.icon, required this.title, required this.content, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      onSubmit: (){}, 
      header: Image.asset("res/images/$icon.png"), 
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title.hs(context),
            16.h(),
            content.ts(context),
            16.h(),
            Row(
              children: [
                Expanded(
                  child: StyledButton(
                    w: 160,
                    rounded: true,
                    onClick: (){
                      context.back();
                    }, 
                    text: "CANCEL"
                  ),
                ),
                16.w(),
                Expanded(
                  child: StyledButton(
                    w: 160,
                    rounded: true,
                    onClick: ()=>onSuccess(), 
                    text: "YES"
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}