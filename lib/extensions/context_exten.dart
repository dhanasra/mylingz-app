import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  
  Future goto(String path, {Object? args, bool clear = false})async{
    if(clear){
      return await Navigator.pushNamedAndRemoveUntil(this, path, (route) => false, arguments: args);
    }else{
      return await Navigator.pushNamed(this, path, arguments: args);
    }
  }

  back(){
    Navigator.pop(this);
  }

  ThemeData theme(){
    return Theme.of(this);
  }
}
