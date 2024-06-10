import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/utils/global.dart';
import 'package:mylingz_app/widgets/link_item.dart';

import '../../../constants/assets_const.dart';
import '../../../constants/string_const.dart';
import '../../links/bloc/links_bloc.dart';

class DashboardFragment extends StatelessWidget {
  const DashboardFragment({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LinksBloc, LinksState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
          children: [

            ...(Global.links.isEmpty
              ? [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(AssetsConst.launch, width: 300),
                      16.h(),
                      StringConst.noLingzTitle
                          .hm(context, align: TextAlign.center),
                      8.h(),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: StringConst.noLingzSub.ts(context,
                            align: TextAlign.center, color: Colors.grey),
                      )
                    ],
                  )
                ]
              : [
                  16.h(),
                  StringConst.generatedLinks.ts(context),
                  20.h(),
                  ...Global.links.map((e) => LinkItem(link: e))
                ])
          ],
        );
      },
    );
  }
}
