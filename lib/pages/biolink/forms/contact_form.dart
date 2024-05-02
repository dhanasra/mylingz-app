import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../../../constants/string_const.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController mailController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> mode = ValueNotifier(AutovalidateMode.disabled);

    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, value, __) {
        return Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Name".ts(context),
              8.h(),
              TextFormField(
                controller: nameController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v, "Name"),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outlined),
                  hintText: StringConst.nameHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Mobile Number".ts(context),
              8.h(),
              TextFormField(
                controller: phoneController,
                validator: (v)=>Validator.validatePhoneNumber(v),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined),
                  hintText: StringConst.phoneHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),  
              12.h(),
              "Email Address".ts(context),
              8.h(),
              TextFormField(
                controller: mailController,
                validator: (v)=>Validator.validateEmail(v, required:  false),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: StringConst.emailHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              32.h(),
              StyledButton(
                onClick: (){
                  if(!formKey.currentState!.validate()){
                    mode.value = AutovalidateMode.always;
                    return;
                  }
                  var data = """
                    BEGIN:VCARD
                    VERSION:1.0
                    N:${nameController.trim()}
                    TEL:${phoneController.trim()}
                    EMAIL:${mailController.trim()}
                    END:VCARD
                  """;
                  // context.goto(Routes.customize, args: { 
                  //   "data": {
                  //     "value": data,
                  //     "name": nameController.trim(),
                  //     "phone": phoneController.trim(),
                  //     "email": mailController.trim()
                  //   }, 
                  //   "name": "Contact" 
                  // });
                }, 
                text: StringConst.create.toUpperCase()
              )
            ],
          ),
        );
      }
    );
  }
}