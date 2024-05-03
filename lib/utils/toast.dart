import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';

class Toast {

  static show(BuildContext context, {required String message, String type = "success"}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        content: StyledWrapper(
          p: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Image.asset("res/images/$type.png", width: 32,),
              16.w(),
              Expanded(child: message.tl(context, color: type=="success" 
                ? Colors.green: type=="failure" ? Colors.red : Colors.deepOrange))
            ],
          ),
        ),
      ),
    );
  }

}