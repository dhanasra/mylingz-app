import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  
  Future<dynamic> goto(String path, {Object? args, bool clear = false})async{
    if(clear){
      return await Navigator.pushNamedAndRemoveUntil(this, path, (route) => false, arguments: args);
    }else{
      return await Navigator.pushNamed(this, path, arguments: args);
    }
  }

  back({Object? args}){
    Navigator.pop(this, args);
  }

  ThemeData theme(){
    return Theme.of(this);
  }

  double sw(){
    return MediaQuery.of(this).size.width;
  }

  double sh(){
    return MediaQuery.of(this).size.height;
  }
}
