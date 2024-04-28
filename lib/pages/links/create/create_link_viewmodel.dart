import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/constants/url_const.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/links/bloc/links_bloc.dart';

class CreateLinkViewModel extends BaseViewModel {

  final GlobalKey<FormState> formkey = GlobalKey();
  
  late TextEditingController destController;
  late TextEditingController titleController;
  late TextEditingController backHalfController;
  bool isBioLink = false;
  late TextEditingController btnLableController;

  late ValueNotifier<AutovalidateMode> mode;

  CreateLinkViewModel(){
    destController = TextEditingController();
    titleController = TextEditingController();
    backHalfController = TextEditingController();
    btnLableController = TextEditingController();
    mode = ValueNotifier(AutovalidateMode.disabled);
  }

  save(BuildContext context){
    if(!formkey.currentState!.validate()){
      mode.value = AutovalidateMode.always;
      return;
    }

    context.read<LinksBloc>().add(
      SaveLinkEvent(
        url: destController.trim(), 
        title: titleController.trimNull(), 
        short: backHalfController.trim(), 
        domain: UrlConst.domainName, 
        isBioLink: isBioLink,
        btnLabel: btnLableController.trimNull()
      )
    );
  }
  
  @override
  dispose() {

  }

}