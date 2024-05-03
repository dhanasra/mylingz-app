import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../../../constants/assets_const.dart';
import '../../../constants/string_const.dart';
import '../../../utils/global.dart';
import '../../../widgets/favourite_item.dart';

class FavouritesFragment extends StatelessWidget {
  const FavouritesFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Global.favourites,
      builder: (_, value, __) {

        if(value.isEmpty){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsConst.empty, width: 300),
              16.h(),
              StringConst.noFavTitle.hm(context, align: TextAlign.center),
              8.h(),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 250
                ),
                child: StringConst.noFavSub.ts(
                  context, align: TextAlign.center, color: Colors.grey),  
              )
            ],
          );
        }

        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ...value.map((e) => FavouriteItem(link: e))
          ],
        );
      }
    );
  }
}
