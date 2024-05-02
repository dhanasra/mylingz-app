import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';

import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/social_link.dart';
import 'package:mylingz_app/utils/utils.dart';

import '../../../constants/string_const.dart';
import '../../../network/models/social_icon.dart';
import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';

class SocialForm extends StatelessWidget {
  final SocialIcon icon;
  const SocialForm({super.key, required this.icon});

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
              Image.network(icon.icon),
              16.h(),
              icon.name.ts(context),
              8.h(),
              TextFormField(
                controller: controller,
                validator: (v)=>Validator.validateNonNullOrEmpty(v, icon.name),
                decoration: InputDecoration(
                  prefixIcon: Icon(icon.type=="username" ? Icons.edit_outlined: Icons.link_outlined),
                  hintText: icon.type=="username" 
                    ? "Enter ${icon.name.toLowerCase()} username here" 
                    : "Enter ${icon.name.toLowerCase()} profile link here" 
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
                    case "instagram": data = "https://www.instagram.com/${controller.trim()}";
                    case "x": data = "https://twitter.com/${controller.trim()}";
                    case "snapchat": data = "https://www.snapchat.com/add/${controller.trim()}";
                    case "paypal": data = "https://www.paypal.me/${controller.trim()}";
                    case "pinterest": data = "https://www.pinterest.com/${controller.trim()}";
                    case "tiktok" || "linkedin" || "wechat" || "line": data = controller.trim();
                  }

                  context.back(args: SocialLink(
                      id: generateUniqueString(), 
                      name: icon.name, 
                      icon: icon.icon, 
                      data: {
                        "value": data,
                        "text": controller.trim()
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