import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/auth/bloc/auth_bloc.dart';

class SignupViewModel extends BaseViewModel {
  final GlobalKey<FormState> formkey = GlobalKey();
  
  late TextEditingController fnameController;
  late TextEditingController lnameController;
  late TextEditingController emailController;
  late TextEditingController pwController;

  late ValueNotifier<bool> passwordVisible;
  late ValueNotifier<AutovalidateMode> mode;

  SignupViewModel(){
    fnameController = TextEditingController();
    lnameController = TextEditingController();
    emailController = TextEditingController();
    pwController = TextEditingController();
    passwordVisible = ValueNotifier(false);
    mode = ValueNotifier(AutovalidateMode.disabled);
  }

  createAccount(BuildContext context){

    if(!formkey.currentState!.validate()){
      mode.value = AutovalidateMode.always;
      return;
    }

    context.read<AuthBloc>().add(
      SignupEvent(
        fname: fnameController.trim(), 
        lname: lnameController.trim(), 
        email: emailController.trim(), 
        password: pwController.trim()
      )
    );
  }
  
  @override
  dispose() {

  }

}