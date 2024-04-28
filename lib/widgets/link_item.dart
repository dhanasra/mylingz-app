import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkItem extends StatelessWidget {
  final ShortLink link;
  const LinkItem({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return StyledWrapper(
      m: const EdgeInsets.only(bottom: 16),
      p: const EdgeInsets.fromLTRB(16, 12, 0, 12),
      onClick: (){
        launchUrlString("${link.domain}/${link.short}");
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
                ("${link.domain.removeHttps()}/${link.short}").ts(context)
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
                onSelected: (v)=>{},
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
                    value: 'edit',
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
                    value: 'delete',
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