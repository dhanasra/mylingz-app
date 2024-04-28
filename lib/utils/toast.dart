import 'package:flutter/material.dart';

class Toast {

  static show(BuildContext context, {required String message}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

}