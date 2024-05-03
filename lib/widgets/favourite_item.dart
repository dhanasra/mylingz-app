import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';

import '../routes/app_routes.dart';

class FavouriteItem extends StatelessWidget {
  final ShortLink link;
  const FavouriteItem({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return StyledWrapper(
      onClick: (){
        context.goto(Routes.linkDetails, args: link.id);
      },
      p: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                link.title?.hm(context),
                ("${link.domain.removeHttps()}/${link.short}").ts(context, isLink: true)
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_right_rounded)
        ],
      ));
  }
}