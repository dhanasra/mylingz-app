import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  
  goto(String path, {Object? args, bool clear = false}){
    if(clear){
      Navigator.pushNamedAndRemoveUntil(this, path, (route) => false, arguments: args);
    }else{
      Navigator.pushNamed(this, path, arguments: args);
    }
  }

  back(){
    Navigator.pop(this);
  }
}