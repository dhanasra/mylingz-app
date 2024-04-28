import 'package:flutter/material.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';

class CreateLinkViewModel extends BaseViewModel {
  
  late TextEditingController destController;

  CreateLinkViewModel(){
    destController = TextEditingController();
  }
  
  @override
  dispose() {

  }

}