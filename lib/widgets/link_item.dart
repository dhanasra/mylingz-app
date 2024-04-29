import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/date_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/routes/app_routes.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/toast.dart';

class LinkItem extends StatelessWidget {
  final ShortLink link;
  const LinkItem({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return StyledWrapper(
      m: const EdgeInsets.only(bottom: 16),
      p: const EdgeInsets.fromLTRB(16, 12, 0, 12),
      onClick: (){
        launchUrl(Uri.parse("${link.domain}/${link.short}"));
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: context.theme().primaryColorLight,
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage("http://www.google.com/s2/favicons?domain=buizcard.com")
            ),
          ),
          8.w(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                link.title?.hm(context),
                ("${link.domain.removeHttps()}/${link.short}").ts(context, isLink: true),
                Text("${link.createdAt.format("dd MMM, yyyy")} . 23 views", style: const TextStyle(fontSize: 12)).tr()
              ],
            ),
          ),
          8.w(),
          SizedBox(
            width: 60,
            child: PopupMenuButton(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                constraints: const BoxConstraints(
                  minWidth: 200
                ),
                onSelected: (v){
                  
                  var shortLink = "${link.domain}/${link.short}";

                  if(v=="view"){
                    context.goto(Routes.linkDetails, args: link.id);
                  }else if(v=="copy"){
                    Clipboard.setData(ClipboardData(text: shortLink));
                    Toast.show(context, message: "Copied successfully!");
                  }else if(v=="share"){
                    Share.share(shortLink);
                  }else if(v=="bioLink"){

                  }else if(v=="delete"){

                  }
                },
                itemBuilder: (_){
                return[
                  PopupMenuItem<String>(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    value: 'view',
                    child: Row(
                      children: [
                        const Icon(Icons.remove_red_eye_outlined, size: 20),
                        24.w(),
                        "View Link Detail".ts(context)
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    value: 'copy',
                    child: Row(
                      children: [
                        const Icon(Icons.copy_outlined, size: 20),
                        24.w(),
                        "Copy Link".ts(context)
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    value: 'share',
                    child: Row(
                      children: [
                        const Icon(Icons.share_outlined, size: 20),
                        24.w(),
                        "Share Link".ts(context)
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    value: 'bioLink',
                    child: Row(
                      children: [
                        const Icon(Icons.person_add_alt_outlined, size: 20),
                        24.w(),
                        "Add Link In Bio".ts(context)
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    value: 'delete',
                    child: Row(
                      children: [
                        const Icon(Icons.delete_outlined, size: 20, color: Colors.red),
                        24.w(),
                        "Delete Link".ts(context, color: Colors.red)
                      ],
                    ),
                  ),
                ];
              }),
          )
        ],
      ),
    );
  }
}