import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../bloc/auth_bloc.dart';

class LoginViewModel extends BaseViewModel {
  
  final GlobalKey<FormState> formkey = GlobalKey();
  
  late TextEditingController emailController;
  late TextEditingController pwController;

  late ValueNotifier<bool> passwordVisible;
  late ValueNotifier<AutovalidateMode> mode;

  LoginViewModel(){
    emailController = TextEditingController();
    pwController = TextEditingController();
    passwordVisible = ValueNotifier(false);
    mode = ValueNotifier(AutovalidateMode.disabled);
  }
  
  loginAccount(BuildContext context){

    if(!formkey.currentState!.validate()){
      mode.value = AutovalidateMode.always;
      return;
    }

    context.read<AuthBloc>().add(
      LoginEvent(
        email: emailController.trim(), 
        password: pwController.trim()
      )
    );
  }
  
  @override
  dispose() {

  }

}