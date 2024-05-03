import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/constants/color_const.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/pages/links/create/create_link_viewmodel.dart';
import 'package:mylingz_app/widgets/styled_button.dart';

import '../../../constants/string_const.dart';
import '../../../utils/validator.dart';
import '../bloc/links_bloc.dart';

class CreateLinkView extends StatefulWidget {
  final ShortLink? link;
  const CreateLinkView({super.key, this.link});

  @override
  State<CreateLinkView> createState() => _CreateLinkViewState();
}

class _CreateLinkViewState extends State<CreateLinkView> {
  late CreateLinkViewModel _viewModel;

  @override
  void initState() {
    _viewModel = CreateLinkViewModel(widget.link);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LinksBloc, LinksState>(
      listener: (context, state) {
        if(state is Success){
          context.back();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text( _viewModel.link!=null ? "Edit": StringConst.create).tr(),
        ),
        body: ValueListenableBuilder(
          valueListenable: _viewModel.mode,
          builder: (_, value, __) {
            return Form(
              key: _viewModel.formkey,
              autovalidateMode: value,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
                children: [
                  StringConst.destUrlLabel.ts(context),
                  8.h(),
                  TextFormField(
                    controller: _viewModel.destController,
                    validator: (v) => Validator.validateNonNullOrEmpty(v, "Url"),
                    decoration:
                        InputDecoration(hintText: StringConst.destUrlHint.tr()),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  12.h(),
                  "Title".ts(context),
                  8.h(),
                  TextFormField(
                    controller: _viewModel.titleController,
                    decoration: InputDecoration(hintText: "Enter Title".tr()),
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
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      12.w(),
                      "/".tl(context),
                      12.w(),
                      Expanded(
                        flex: 6,
                        child: TextFormField(
                          controller: _viewModel.backHalfController,
                          decoration: InputDecoration(hintText: "Enter Title".tr()),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    ],
                  ),
                  12.h(),
                  Divider(
                    color: context.theme().colorScheme.background,
                  ),
                  ListTile(
                    title: "Use This Link In Bio"
                        .ts(context, color: ColorConst.primary, align: TextAlign.end),
                    trailing: Checkbox(
                      value: _viewModel.isBioLink,
                      onChanged: (v) {
                        setState(() {
                          _viewModel.isBioLink = v!;
                        });
                      },
                    ),
                    contentPadding: const EdgeInsets.only(left: 4),
                  ),
                  Visibility(
                    visible: _viewModel.isBioLink,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: context.theme().colorScheme.background),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Link-In-Bio Button Label".ts(context),
                          8.h(),
                          TextFormField(
                            controller: _viewModel.btnLableController,
                            validator: (v) =>
                                Validator.validateNonNullOrEmpty(v, "Url"),
                            decoration: InputDecoration(
                                hintText: "Enter Title".tr(),
                                helperText:
                                    "You can add this link to multiple Link-in-bios later."),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  34.h(),
                  StyledButton(onClick: ()=>_viewModel.save(context), text: (_viewModel.link!=null ? "Save": StringConst.create).toUpperCase())
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
