import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/biolink/basic_info/basic_info_viewmodel.dart';
import 'package:mylingz_app/utils/validator.dart';
import 'package:mylingz_app/widgets/styled_button.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';

import '../../../common/image/image_bloc.dart';
import '../bloc/bio_link_bloc.dart';

class BasicInfoView extends StatefulWidget {
  const BasicInfoView({super.key});

  @override
  State<BasicInfoView> createState() => _BasicInfoViewState();
}

class _BasicInfoViewState extends State<BasicInfoView> {
  late BasicInfoViewModel _viewModel;

  @override
  void initState() {
    _viewModel = BasicInfoViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BioLinkBloc, BioLinkState>(
      listener: (context, state) {
        if (state is Success) {
          context.back();
        }
      },
      child: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {

          if(state is ImageUploaded){
            _viewModel.image = state.url;
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text("Basic Information"),
            ),
            body: ValueListenableBuilder(
                valueListenable: _viewModel.mode,
                builder: (_, value, __) {
                  return Form(
                    key: _viewModel.formKey,
                    autovalidateMode: value,
                    child: ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Logo".ts(context),
                            GestureDetector(
                              onTap: (){
                                _viewModel.image = null;
                                setState(() {});
                              },
                              child: Visibility(
                                visible: _viewModel.image != null,
                                child: "Remove".ts(context,
                                color: context.theme().primaryColorLight),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            InkWell(
                              onTap: ()=>context.read<ImageBloc>().add(PickAndUploadImage()),
                              child: StyledWrapper(
                                r: 100,
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: _viewModel.image!=null
                                    ? NetworkImage(_viewModel.image!) 
                                    : null
                                ),
                              )
                            ),
                            Visibility(
                              visible: state is ImageUploading,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          ],
                        ),
                        12.h(),
                        "Title".ts(context),
                        8.h(),
                        TextFormField(
                          controller: _viewModel.titleController,
                          validator: (v) =>
                              Validator.validateNonNullOrEmpty(v, "Title"),
                          decoration: InputDecoration(
                              hintText: "Enter title here".tr()),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        12.h(),
                        "Slogan".ts(context),
                        8.h(),
                        TextFormField(
                          controller: _viewModel.sloganController,
                          decoration: InputDecoration(
                              hintText: "Enter slogan here".tr()),
                          maxLines: 5,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        32.h(),
                        StyledButton(
                            onClick: () => _viewModel.save(context),
                            text: "SAVE")
                      ],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
