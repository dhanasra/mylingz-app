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
import '../../../widgets/styled_button.dart';

class VcardForm extends StatelessWidget {
  final SocialIcon icon;
  const VcardForm({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController mailController = TextEditingController();
    final TextEditingController companyNameController = TextEditingController();
    final TextEditingController jobTitleController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController websiteController = TextEditingController();
    final TextEditingController noteController = TextEditingController();
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
              "Name".ts(context),
              8.h(),
              TextFormField(
                controller: nameController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v, "Name"),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outlined),
                  hintText: StringConst.nameHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Mobile Number".ts(context),
              8.h(),
              TextFormField(
                controller: phoneController,
                validator: (v)=>Validator.validatePhoneNumber(v),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined),
                  hintText: StringConst.phoneHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),  
              12.h(),
              "Email Address".ts(context),
              8.h(),
              TextFormField(
                controller: mailController,
                validator: (v)=>Validator.validateEmail(v, required:  false),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: StringConst.emailHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Company Name".ts(context),
              8.h(),
              TextFormField(
                controller: companyNameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.business_outlined),
                  hintText: StringConst.companyHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Job Title".ts(context),
              8.h(),
              TextFormField(
                controller: jobTitleController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.work_outline),
                  hintText: StringConst.jobTitleHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              "Address".ts(context),
              8.h(),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.room_outlined),
                  hintText: StringConst.addrHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Website".ts(context),
              8.h(),
              TextFormField(
                controller: websiteController,
                validator: (v)=>Validator.isValidURL(v, "Website", required: false),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.link_outlined),
                  hintText: StringConst.websiteHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
               12.h(),
              "Note".ts(context),
              8.h(),
              TextFormField(
                controller: noteController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: StringConst.noteHint.tr()
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
                  var data = "BEGIN:VCARD;VERSION:3.0;N:${nameController.trim()}";

                  if(phoneController.trim().isNotEmpty){
                    data += ";TEL:${phoneController.trim()}";
                  }

                  if(mailController.trim().isNotEmpty){
                    data += ";EMAIL:${mailController.trim()}";
                  }

                  if(noteController.trim().isNotEmpty){
                    data += ";NOTE:${noteController.trim()}";
                  }

                  if(addressController.trim().isNotEmpty){
                    data += ";ADR:${addressController.trim()}";
                  }

                  if(companyNameController.trim().isNotEmpty){
                    data += ";ORG:${companyNameController.trim()}";
                  }

                  if(jobTitleController.trim().isNotEmpty){
                    data += ";TITLE:${jobTitleController.trim()}";
                  }

                  if(websiteController.trim().isNotEmpty){
                    data += ";URL:${websiteController.trim()}";
                  }

                  data += ";END:VCARD";
                  context.back(args: SocialLink(
                      id: generateUniqueString(), 
                      name: icon.name, 
                      data: {
                        "value": data,
                        "name": nameController.trim(),
                        "phone": phoneController.trim(),
                        "email": mailController.trim(),
                        "company": companyNameController.trim(),
                        "jobTitle": jobTitleController.trim(),
                        "address": addressController.trim(),
                        "website": websiteController.trim(),
                        "note": noteController.trim()
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