import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mylingz_app/constants/assets_const.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/biolink/bloc/bio_link_bloc.dart';
import 'package:mylingz_app/utils/global.dart';
import 'package:mylingz_app/utils/toast.dart';
import 'package:mylingz_app/widgets/styled_button.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';

class PromoteView extends StatefulWidget {
  const PromoteView({super.key});

  @override
  State<PromoteView> createState() => _PromoteViewState();
}

class _PromoteViewState extends State<PromoteView> {
  late bool isPromote;

  @override
  void initState() {
    isPromote = Global.bioLink.value!.promote;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BioLinkBloc, BioLinkState>(
      listener: (context, state) {
        if(state is Success){
          Toast.show(context, message: "Updated successfully!", type: "success");
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Promote"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            StyledWrapper(
                p: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    "Discover Page".hm(context),
                    Lottie.asset(AssetsConst.promote, height: 200),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child:
                          "Get more visits on MYLingz Discover page on App and Website"
                              .tl(context,
                                  color: Colors.grey, align: TextAlign.center),
                    ),
                    16.h(),
                    SizedBox(
                        width: 200,
                        child: !isPromote
                            ? StyledButton(
                                onClick: () {
                                  context
                                      .read<BioLinkBloc>()
                                      .add(UpdatePromoteEvent(promote: true));
                                  setState(() {
                                    isPromote = true;
                                  });
                                },
                                text: "Publish",
                                rounded: true,
                              )
                            : TextButton(
                                onPressed: () {
                                  context
                                      .read<BioLinkBloc>()
                                      .add(UpdatePromoteEvent(promote: false));
                                  setState(() {
                                    isPromote = false;
                                  });
                                },
                                child:
                                    "Unpublish".tl(context, color: Colors.red)))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
