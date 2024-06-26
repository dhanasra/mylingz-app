import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/home/home_viewmodel.dart';
import 'package:mylingz_app/routes/app_routes.dart';
import 'package:mylingz_app/utils/global.dart';
import 'package:mylingz_app/widgets/bio_link_item.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';

import '../../biolink/bloc/bio_link_bloc.dart';

class BioLinkFragment extends StatelessWidget {
  final HomeViewModel vm;
  const BioLinkFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BioLinkBloc, BioLinkState>(
      builder: (context, state) {

        if(state is PublishToggled){
          vm.isPublished = state.value;
        }

        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ValueListenableBuilder(
                valueListenable: Global.bioLink,
                builder: (_, value, __) {
                  return BioLinkItem(
                    bioLink: value!, options: vm.options, isPublished: vm.isPublished);
                }),
            16.h(),
            StyledWrapper(
                onClick: () => context.goto(Routes.formMessages),
                p: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.message_outlined,
                                size: 20,
                              ),
                              8.w(),
                              Expanded(
                                child: "Form Messages".tl(context),
                              ),
                            ],
                          ),
                          8.h(),
                          "All form message in this link are controlled here"
                              .ts(context, light: true, color: Colors.grey)
                        ],
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_right_outlined)
                  ],
                )),
            16.h(),
            StyledWrapper(
                onClick: () => context.goto(Routes.design),
                p: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.color_lens_outlined, size: 20),
                              8.w(),
                              Expanded(
                                child: "Appearence & Theme".tl(context),
                              ),
                            ],
                          ),
                          8.h(),
                          "Design your page with more attractive appearence & theme"
                              .ts(context, light: true, color: Colors.grey)
                        ],
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_right_outlined)
                  ],
                )),
            16.h(),
            StyledWrapper(
                onClick: () => context.goto(Routes.promote),
                p: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.volume_up_outlined, size: 20),
                              8.w(),
                              Expanded(
                                child: "Promote".tl(context),
                              ),
                            ],
                          ),
                          8.h(),
                          "Promote your links on MYLingz official Dicover page"
                              .ts(context, light: true, color: Colors.grey)
                        ],
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_right_outlined)
                  ],
                )),
            24.h(),
            ValueListenableBuilder(
              valueListenable: Global.bioLink,  
                builder: (_, value, __) {
                return Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 160,
                    child: TextButton(
                        onPressed: (){
                          context.read<BioLinkBloc>().add(TogglePublishEvent(isPublished: !vm.isPublished));
                        },
                        child: ( vm.isPublished ? "UNPUBLISH": "PUBLISH").tl(context, color: vm.isPublished ? Colors.red: Colors.green)),
                  ),
                );
              }
            ),
            32.h()
          ],
        );
      },
    );
  }
}
