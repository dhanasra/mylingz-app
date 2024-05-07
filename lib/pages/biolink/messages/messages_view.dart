import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/biolink/messages/messages_viewmodel.dart';
import 'package:mylingz_app/utils/global.dart';
import 'package:mylingz_app/widgets/message_item.dart';
import 'package:share_plus/share_plus.dart';

import '../../../constants/assets_const.dart';
import '../../../widgets/styled_button.dart';
import '../bloc/bio_link_bloc.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  late MessagesViewModel _viewModel;

  @override
  void initState() {
    _viewModel = MessagesViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Messages"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.download_outlined)),
          8.w()
        ],
      ),
      body: BlocBuilder<BioLinkBloc, BioLinkState>(
        builder: (context, state) {
          if(state is MessagesFetched){
            _viewModel.messages = state.messages;
          }

          if(state is MessagesFetched && _viewModel.messages.isEmpty){
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AssetsConst.notFound, width: 300),
                  24.h(),
                  "No Messages Found".hm(context, align: TextAlign.center),
                  8.h(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 250
                    ),
                    child: "Share Your BioLink And Collect Your Data Now".ts(
                      context, align: TextAlign.center, color: Colors.grey),  
                  ),
                  32.h(),
                  StyledButton(
                    w: 160,
                    rounded: true,
                    onClick: ()=>{
                      Share.share("${Global.bioLink.value!.domainName}/${Global.bioLink.value!.bioId}")
                    },
                    text: "Share Link",
                  )
                ],
              ),
            );
          }else if(state is MessagesFetched){
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              children: [
                ..._viewModel.messages.map((e) => MessageItem(message: e))
              ]
            );
          }else{
            return const SizedBox.shrink();
          }
        },
      ),  
    );
  }
}
