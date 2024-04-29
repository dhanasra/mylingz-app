import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/utils/global.dart';
import 'package:mylingz_app/widgets/bio_link_item.dart';
import 'package:mylingz_app/widgets/link_item.dart';

class DashboardFragment extends StatelessWidget {
  const DashboardFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
      children: [
        16.h(),
        "BIO LINK".ts(context),
        20.h(),
        BioLinkItem(bioLink: Global.bioLink!),
        16.h(),
        "CREATED LINKS".ts(context),
        20.h(),
        ...Global.links.map((e) => LinkItem(link: e))
      ],
    );
  }
} 