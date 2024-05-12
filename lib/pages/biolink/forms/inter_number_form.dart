import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';

import '../../../constants/string_const.dart';

import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../../../network/models/social_icon.dart';
import '../../../network/models/social_link.dart';
import '../../../utils/utils.dart';
import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';

class InterNumberForm extends StatelessWidget {
  final SocialIcon icon;
  const InterNumberForm({super.key, required this.icon});

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
              Image.network(getIconUrl("colored", icon.name.toLowerCase())),
              16.h(),
              icon.name.ts(context),
              8.h(),
              TextFormField(
                controller: controller,
                validator: (v)=>Validator.validatePhoneNumber(v),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined),
                  hintText: "Enter ${icon.name.toLowerCase()} number here"
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
                  var app = icon.name.toLowerCase();

                  switch(app){
                    case "whatsapp": "whatsapp:${controller.trim()}";
                    case "viber": data = "viber://add?number=${controller.trim()}";
                  }
                  context.back(args: SocialLink(
                      id: generateUniqueString(), 
                      name: icon.name, 
                      data: {
                        "value": data,
                        "phone": controller.trim()
                      }, 
                      type: icon.type
                  ));
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