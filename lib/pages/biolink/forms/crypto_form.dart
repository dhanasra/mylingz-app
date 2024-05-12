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

class CryptoForm extends StatelessWidget {
  final SocialIcon icon;
  const CryptoForm({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    final TextEditingController addressController = TextEditingController();
    final TextEditingController amountController = TextEditingController();
    final TextEditingController messageController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> mode = ValueNotifier(AutovalidateMode.disabled);
    final ValueNotifier<String> currency = ValueNotifier("Bitcoin");

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
              "Crypto Currency".ts(context),
              8.h(),
              SingleSelect(
                items: const [
                  "Bitcoin", "Bitcoin Cash", "Ether", "Litecoin", "Dash"
                ], 
                value: "Bitcoin",
                onChanged: (v){
                  currency.value = v;
                },
              ),
              12.h(),
              ValueListenableBuilder(
                valueListenable: currency, 
                builder: (_, value, __){
                  return "$value Address".ts(context);
                }),
              8.h(),
              TextFormField(
                controller: addressController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v, "Address"),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone_android_outlined),
                  hintText: "Enter address here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Amount".ts(context),
              8.h(),
              TextFormField(
                controller: amountController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v, "Amount"),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone_android_outlined),
                  hintText: "Enter amount here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Messgae".ts(context),
              8.h(),
              TextFormField(
                controller: messageController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Enter message here"
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
                  var currencyCode = {
                    "Bitcoin": "bitcoin",
                    "Bitcoin Cash": "bitcoincash",
                    "Ether": "ethereum",
                    "Litecoin": "litecoin",
                  }[currency.value];
                  var data = "$currencyCode:${addressController.trim()}?amount=${amountController.trim()}&message=${messageController.trim()}";
                  context.back(args: SocialLink(
                      id: generateUniqueString(), 
                      name: icon.name, 
                      data: {
                        "value": data,
                        "currency": currency.value,
                        "address": addressController.trim(),
                        "amount": amountController.trim(),
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