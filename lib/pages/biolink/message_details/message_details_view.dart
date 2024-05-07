import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/biolink/message_details/message_details_viewmodel.dart';
import 'package:mylingz_app/routes/app_routes.dart';
import 'package:mylingz_app/utils/toast.dart';

import '../../../network/models/form_message.dart';
import '../bloc/bio_link_bloc.dart';

class MessageDetailsView extends StatefulWidget {
  final FormMessage message;
  const MessageDetailsView({super.key, required this.message});

  @override
  State<MessageDetailsView> createState() => _MessageDetailsViewState();
}

class _MessageDetailsViewState extends State<MessageDetailsView> {
  late MessageDetailsViewModel _viewModel;

  @override
  void initState() {
    _viewModel = MessageDetailsViewModel(widget.message);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BioLinkBloc, BioLinkState>(
      listener: (context, state) {
        if(state is MessageDeleted){
          Toast.show(context, message: "Message removed successfully!", type: "success");
          context.goto(Routes.home, clear: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Message Details"),
          actions: [
            IconButton(
                onPressed: ()=>context.read<BioLinkBloc>().add(
                  DeleteMessagesEvent(messageId: widget.message.id)),
                icon: const Icon(
                  Icons.delete_outlined,
                  color: Colors.red,
                )),
            8.w()
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ..._viewModel.message.data.map((e) => AbsorbPointer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      e.label.ts(context),
                      8.h(),
                      TextFormField(
                        initialValue: e.value,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      12.h(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
