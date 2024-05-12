import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../../../constants/string_const.dart';
import '../../../network/models/social_icon.dart';
import '../../../network/models/social_link.dart';
import '../../../utils/utils.dart';
import '../../../utils/validator.dart';
import '../../../widgets/single_select.dart';
import '../../../widgets/styled_button.dart';

class WifiForm extends StatelessWidget {
  final SocialIcon icon;
  const WifiForm({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    var security = "";
    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> mode = ValueNotifier(AutovalidateMode.disabled);
    final ValueNotifier<bool> passwordVisible = ValueNotifier(false);

    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, value, __) {
        return Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Network name (SSID)".ts(context),
              8.h(),
              TextFormField(
                controller: nameController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v,"Network name"),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.wifi_outlined),
                  hintText: StringConst.networkHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Security".ts(context),
              8.h(),
              SingleSelect(
                items: const [
                  "WPA/WPA2", "WEP", "None"
                ], 
                value: "WPA/WPA2",
                prefixIcon: Icons.security,
                onChanged: (v){
                  security = v;
                },
              ),
              12.h(),
              "Password".ts(context),
              8.h(),
              ValueListenableBuilder(
                valueListenable: passwordVisible,
                builder: (_, value, __) {
                  return TextFormField(
                    controller: passwordController,
                    validator: (v)=>Validator.validateNonNullOrEmpty(v,"Password"),
                    obscureText: !value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outlined),
                      hintText: StringConst.passwordHint.tr(),
                      suffixIcon: IconButton(
                        onPressed: ()=>passwordVisible.value = !passwordVisible.value, 
                        icon: Icon(passwordVisible.value ? Icons.remove_red_eye: Icons.remove_red_eye_outlined))
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                }
              ),
              32.h(),
              StyledButton(
                onClick: (){
                  if(!formKey.currentState!.validate()){
                    mode.value = AutovalidateMode.always;
                    return;
                  }
                  var data = "WIFI:S:${nameController.trim()};T:$security;P:${passwordController.trim()}";
                  context.back(args: SocialLink(
                      id: generateUniqueString(), 
                      name: icon.name, 
                      data: {
                        "value": data,
                        "name": nameController.trim(),
                        "mode": security,
                        "password": passwordController.trim()
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