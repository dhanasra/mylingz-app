import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mylingz_app/constants/color_const.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/bio_link.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';

class BioLinkItem extends StatelessWidget {
  final BioLink bioLink;
  const BioLinkItem({super.key, required this.bioLink});

  @override
  Widget build(BuildContext context) {
    
    return StyledWrapper(
      p: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [

              const CircleAvatar(
                radius: 36,
                // backgroundImage: NetworkImage(url),
              ),
              8.w(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bioLink.name.hm(context),
                    Text("${bioLink.domainName}/${bioLink.bioId}".removeHttps()),
                    2.h(),
                    "Link in bio".ts(context)
                  ],
                ),
              )
            ],
          ),
          16.h(),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      elevation: const MaterialStatePropertyAll(0),
                      backgroundColor: const MaterialStatePropertyAll(Color(0xFFf4f6fa)),
                      foregroundColor: const MaterialStatePropertyAll(ColorConst.primary),
                    ), 
                    child: const Text("Copy"),
                  )
                ),
                16.w(),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){}, 
                    style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      elevation: const MaterialStatePropertyAll(0),
                      backgroundColor: const MaterialStatePropertyAll(ColorConst.primaryLight),
                      foregroundColor: const MaterialStatePropertyAll(Colors.white),
                    ), 
                    child: const Text("Share")
                  )
                )
              ],
            ),
          )

        ],
      ));
  }
}