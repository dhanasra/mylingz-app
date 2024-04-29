import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import 'dialog_wrapper.dart';
import 'styled_button.dart';

class DeleteSheet extends StatefulWidget {
  final VoidCallback onDelete;
  const DeleteSheet({super.key, required this.onDelete});

  @override
  State<DeleteSheet> createState() => _DeleteSheetState();
}

class _DeleteSheetState extends State<DeleteSheet> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      onSubmit: (){}, 
      header: Image.asset("res/images/language.png"), 
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Delet Short Link".hs(context),
            16.h(), 
            
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
                    text: "Cancel"
                  ),
                ),
                16.w(),
                Expanded(
                  child: StyledButton(
                    w: 160,
                    rounded: true,
                    onClick: (){
                      context.back();
                      widget.onDelete();
                    }, 
                    text: "Delete"
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