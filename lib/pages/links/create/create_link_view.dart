import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mylingz_app/constants/color_const.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/links/create/create_link_viewmodel.dart';
import 'package:mylingz_app/widgets/styled_button.dart';

import '../../../constants/string_const.dart';
import '../../../utils/validator.dart';

class CreateLinkView extends StatefulWidget {
  const CreateLinkView({super.key});

  @override
  State<CreateLinkView> createState() => _CreateLinkViewState();
}

class _CreateLinkViewState extends State<CreateLinkView> {
  late CreateLinkViewModel _viewModel;
  var bioLink = false;

  @override
  void initState() {
    _viewModel = CreateLinkViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.create).tr(),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
        children: [
          StringConst.destUrlLabel.ts(context),
          8.h(),
          TextFormField(
            controller: _viewModel.destController,
            validator: (v)=>Validator.validateNonNullOrEmpty(v,"Url"),
            decoration: InputDecoration(
              hintText: StringConst.destUrlHint.tr()
            ),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          12.h(),
          "Title".ts(context),
          8.h(),
          TextFormField(
            controller: _viewModel.destController,
            validator: (v)=>Validator.validateNonNullOrEmpty(v,"Url"),
            decoration: InputDecoration(
              hintText: "Enter Title".tr()
            ),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          12.h(),
          "Custom Back Half".ts(context),
          8.h(),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  initialValue: "lingz.com",
                  enabled: false,
                  validator: (v)=>Validator.validateNonNullOrEmpty(v,"Url"),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              12.w(),
              "/".tl(context),
              12.w(),
              Expanded(
                flex: 6,
                child: TextFormField(
                  controller: _viewModel.destController,
                  validator: (v)=>Validator.validateNonNullOrEmpty(v,"Url"),
                  decoration: InputDecoration(
                    hintText: "Enter Title".tr()
                  ),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            ],
          ),
          12.h(),
          const Divider(
            color: Color(0xFFf4f6fa),
          ),
          
          ListTile(
            title: "Use This Link In Bio".ts(context, color: ColorConst.primary, align: TextAlign.end),
            trailing: Checkbox(
              value: bioLink,
              onChanged: (v){
                setState(() {
                  bioLink = v!;
                });
              },
            ),
            contentPadding: const EdgeInsets.only(left: 4),
          ),

          Visibility(
            visible: bioLink,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xFFf4f6fa)
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Link-In-Bio Button Label".ts(context),
                  8.h(),
                  TextFormField(
                    controller: _viewModel.destController,
                    validator: (v)=>Validator.validateNonNullOrEmpty(v,"Url"),
                    decoration: InputDecoration(
                      hintText: "Enter Title".tr(),
                      helperText: "You can add this link to multiple Link-in-bios later."
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),

          34.h(),
          StyledButton(onClick: (){}, text: StringConst.create.toUpperCase())
        ],
      ),
    );
  }
}