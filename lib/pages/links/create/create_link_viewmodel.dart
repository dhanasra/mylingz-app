import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/constants/url_const.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/pages/links/bloc/links_bloc.dart';

class CreateLinkViewModel extends BaseViewModel {

  final GlobalKey<FormState> formkey = GlobalKey();
  
  late TextEditingController destController;
  late TextEditingController titleController;
  late TextEditingController backHalfController;
  bool isBioLink = false;
  late TextEditingController btnLableController;

  late ValueNotifier<AutovalidateMode> mode;

  ShortLink? link;

  CreateLinkViewModel(this.link){

    destController = TextEditingController(text: link?.url);
    titleController = TextEditingController(text: link?.title);
    backHalfController = TextEditingController(text: link?.short);
    isBioLink = link?.bioLink ?? false;
    btnLableController = TextEditingController(text: link?.bioLinkBtnLabel);
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
        btnLabel: btnLableController.trimNull(),
        id: link?.id
      )
    );
  }
  
  @override
  dispose() {

  }

}