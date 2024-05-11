import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/date_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/form_message.dart';
import 'package:mylingz_app/routes/app_routes.dart';
import 'package:mylingz_app/utils/utils.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';

class MessageItem extends StatelessWidget {
  final FormMessage message;
  const MessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    var content = message.data.firstWhere((element) => element.required==true);

    return StyledWrapper(
      onClick: ()=>context.goto(Routes.messageDetails, args: message),
      m: const EdgeInsets.only(bottom: 16),
      p: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            child: content.value!.substring(0, 1).tl(context, color: context.theme().highlightColor),
          ),
          16.w(),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: content.value!.hm(context, elipsis: true),
                    ),
                    '${message.location["city"]}'.ts(context, color: context.theme().primaryColor)
                  ],
                ),
                2.h(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    message.createdAt.format("dd MMM yyyy, hh: mm").bs(context, color: Colors.grey),
                    Icon(getDeviceIcon(message.device))
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}