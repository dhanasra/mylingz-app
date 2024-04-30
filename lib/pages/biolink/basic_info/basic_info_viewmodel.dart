import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/biolink/bloc/bio_link_bloc.dart';
import 'package:mylingz_app/utils/global.dart';

class BasicInfoViewModel extends BaseViewModel {
  
  final GlobalKey<FormState> formKey = GlobalKey();

  late TextEditingController titleController;
  late TextEditingController sloganController;
  late ValueNotifier image;
  late ValueNotifier<AutovalidateMode> mode;

  BasicInfoViewModel(){
    var bioLink = Global.bioLink.value!;
    titleController = TextEditingController(text: bioLink.title);
    sloganController = TextEditingController(text: bioLink.slogan);
    image = ValueNotifier(bioLink.picture);
    mode = ValueNotifier(AutovalidateMode.disabled);
  }

  save(BuildContext context){
    FocusScope.of(context).unfocus();
    if(!formKey.currentState!.validate()){
      mode.value = AutovalidateMode.always;
      return;
    }

    context.read<BioLinkBloc>().add(
      SaveBasicInfoEvent(
        title: titleController.trim(),
        slogan: sloganController.trimNull(),
        picture: image.value  
      )
    );
  }

  @override
  dispose() {

  }
}