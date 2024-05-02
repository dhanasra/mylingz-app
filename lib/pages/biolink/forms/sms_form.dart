import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';

import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/utils/utils.dart';

import '../../../constants/string_const.dart';
import '../../../network/models/social_icon.dart';
import '../../../network/models/social_link.dart';
import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';

class SmsForm extends StatelessWidget {
  final SocialIcon icon;
  const SmsForm({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    final TextEditingController numberController = TextEditingController();
    final TextEditingController messageController = TextEditingController();
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
              "Mobile Number".ts(context),
              8.h(),
              TextFormField(
                controller: numberController,
                validator: (v)=>Validator.validatePhoneNumber(v),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined),
                  hintText: StringConst.phoneHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),  
               12.h(),
              "Messgae".ts(context),
              8.h(),
              TextFormField(
                controller: messageController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: StringConst.messageHint.tr()
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
                  var data = "smsto:${numberController.trim()}:${messageController.trim()}";
                  context.back(args: SocialLink(
                      id: generateUniqueString(), 
                      name: icon.name, 
                      icon: icon.icon, 
                      data: {
                        "value": data,
                        "phone": numberController.trim(),
                        "message": messageController.trim()
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