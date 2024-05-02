import 'package:flutter/material.dart';

import '../../../constants/string_const.dart';

import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../../../constants/string_const.dart';
import '../../../constants/string_const.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';

class InterNumberForm extends StatelessWidget {
  final String name;
  final String image;
  const InterNumberForm({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
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
              Image.asset(image),
              16.h(),
              name.ts(context),
              8.h(),
              TextFormField(
                controller: controller,
                validator: (v)=>Validator.validatePhoneNumber(v),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined),
                  hintText: "Enter ${name.toLowerCase()} number here"
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
                  
                  var data = "";
                  var app = name.toLowerCase();

                  switch(app){
                    case "whatsapp": "whatsapp:${controller.trim()}";
                    case "viber": data = "viber://add?number=${controller.trim()}";
                  }

                  // context.goto(Routes.customize, args: { 
                  //   "data": {
                  //     "value": data,
                  //     "phone": controller.trim()
                  //   }, 
                  //   "name": name 
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