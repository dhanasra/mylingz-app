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

class WebsiteForm extends StatelessWidget {
  final SocialIcon icon;
  const WebsiteForm({super.key, required this.icon});

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
              "Website".ts(context),
              8.h(),
              TextFormField(
                controller: controller,
                validator: (v)=>Validator.isValidURL(v,"Website"),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.link),
                  hintText: StringConst.webHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              Wrap(
                spacing: 12,
                children: ["https://", "http://", ".com"].map(
                  (e) => InkWell(
                    onTap: ()=>controller.text = "${controller.text}$e",
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.tertiary,
                        boxShadow: [
                          BoxShadow(offset: const Offset(-3, -3), color: Theme.of(context).shadowColor, blurRadius: 10),
                          BoxShadow(offset: const Offset(3, 3), color: Theme.of(context).shadowColor, blurRadius: 10)
                        ]
                      ),
                      child: Text(e),
                    ),
                  )).toList(),
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