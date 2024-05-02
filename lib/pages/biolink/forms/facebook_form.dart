import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';

import '../../../constants/string_const.dart';
import '../../../network/models/social_icon.dart';
import '../../../network/models/social_link.dart';
import '../../../utils/utils.dart';
import '../../../widgets/single_select.dart';

import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';

class FacebookForm extends StatelessWidget {
  final SocialIcon icon;
  const FacebookForm({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    final TextEditingController facebookIdController = TextEditingController();
    final TextEditingController urlController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> mode = ValueNotifier(AutovalidateMode.disabled);
    final ValueNotifier<String> type = ValueNotifier("Facebook ID");

    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, value, __) {
        return Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("res/images/facebook.png"),
              16.h(),
              "Type".ts(context),
              8.h(),
              SingleSelect(
                items: const [
                  "Facebook ID", "URL"
                ], 
                value: "Facebook ID",
                onChanged: (v){
                  type.value = v;
                },
              ),
              12.h(),
              ValueListenableBuilder(
                valueListenable: type, 
                builder: (_, value, __){
                  return value=="Facebook ID"
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Facebook ID".ts(context),
                      8.h(),
                      TextFormField(
                        controller: facebookIdController,
                        validator: (v)=>Validator.validateNonNullOrEmpty(v, "Facebook Id"),
                        decoration: const InputDecoration(
                          hintText: "Enter facebook id here" 
                        ),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "URL".ts(context),
                      8.h(),
                      TextFormField(
                        controller: urlController,
                        validator: (v)=>Validator.isValidURL(v, "Facebook url"),
                        decoration: const InputDecoration(
                          hintText: "Enter facebook url here" 
                        ),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  );
                }),
              32.h(),
              StyledButton(
                onClick: (){
                  if(!formKey.currentState!.validate()){
                    mode.value = AutovalidateMode.always;
                    return;
                  }
                  var data = type.value=="URL"
                  ? urlController.trim(): "https://www.facebook.com/${facebookIdController.trim()}";
                  context.back(args: SocialLink(
                      id: generateUniqueString(), 
                      name: icon.name, 
                      icon: icon.icon, 
                      data: {
                        "value": data,
                        "type": type.value,
                        "url": urlController.trim(),
                        "id": facebookIdController.trim()
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