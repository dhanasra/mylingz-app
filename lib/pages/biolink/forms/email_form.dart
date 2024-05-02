import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../../../constants/string_const.dart';
import '../../../constants/string_const.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController mailController = TextEditingController();
    final TextEditingController subjectController = TextEditingController();
    final TextEditingController contentController = TextEditingController();
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
              "Email Address".ts(context),
              8.h(),
              TextFormField(
                controller: mailController,
                validator: (v)=>Validator.validateEmail(v),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: StringConst.emailHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Subject".ts(context),
              8.h(),
              TextFormField(
                controller: subjectController,
                decoration: InputDecoration(
                  hintText: StringConst.subjectHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Content".ts(context),
              8.h(),
              TextFormField(
                controller: contentController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: StringConst.bodyHint.tr()
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
                  var data = "mailto:${mailController.trim()}?subject=${subjectController.trim()}&body=${contentController.trim()}";
                  // context.goto(Routes.customize, args: { 
                  //   "data": {
                  //     "value": data,
                  //     "email": mailController.trim(),
                  //     "subject": subjectController.trim(),
                  //     "content": contentController.trim()
                  //   }, 
                  //   "name": "Email" 
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