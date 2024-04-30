import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/pages/home/home_viewmodel.dart';
import 'package:mylingz_app/utils/global.dart';
import 'package:mylingz_app/widgets/bio_link_item.dart';

class BioLinkFragment extends StatelessWidget {
  final HomeViewModel vm;
  const BioLinkFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        16.h(),
        BioLinkItem(
          bioLink: Global.bioLink.value!, options: vm.options)
      ],
    );
  }
}