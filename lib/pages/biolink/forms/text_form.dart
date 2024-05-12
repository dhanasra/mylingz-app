import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/social_icon.dart';
import 'package:mylingz_app/utils/utils.dart';

import '../../../constants/string_const.dart';
import '../../../network/models/social_link.dart';
import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';

class TextForm extends StatelessWidget {
  final SocialIcon icon;
  const TextForm({super.key, required this.icon});

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
              "Text".ts(context),
              8.h(),
              TextFormField(
                controller: controller,
                maxLines: 5,
                validator: (v)=>Validator.validateNonNullOrEmpty(v,"Text"),
                decoration: InputDecoration(
                  hintText: StringConst.textHint.tr(),
                  helperText: StringConst.textHelper.tr()
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
                  var data = controller.text;
                  context.back(args: SocialLink(
                      id: generateUniqueString(), 
                      name: icon.name, 
                      data: {
                        "value": data
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