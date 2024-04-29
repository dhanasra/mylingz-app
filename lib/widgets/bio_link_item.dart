import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/bio_link.dart';
import 'package:mylingz_app/widgets/styled_wrapper.dart';

class BioLinkItem extends StatelessWidget {
  final BioLink bioLink;
  final List options;
  const BioLinkItem({super.key, required this.bioLink, required this.options});

  @override
  Widget build(BuildContext context) {
    
    return StyledWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 160,
            child: Stack(
              children: [
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                    color: Color(0xFFf4f6fa),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: StyledWrapper(
                    r: 100,
                    child: CircleAvatar(
                    radius: 50,
                    // backgroundImage: NetworkImage(url),
                  )),
                )
              ],
            ),
          ),
          16.h(),
          bioLink.name.hm(context),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFf4f6fa)),
                    color: const Color(0xFFf4f6fa),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DottedBorder(
                        color: context.theme().primaryColorLight,
                        radius: const Radius.circular(16),
                        borderType: BorderType.RRect,
                        dashPattern: const [6, 3],
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: context.theme().primaryColorLight.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("${bioLink.domainName}/${bioLink.bioId}", 
                                style: TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis, color: context.theme().primaryColor)),
                              ),
                              Icon(Icons.open_in_new, color: context.theme().primaryColor, size: 20)
                            ],
                          ),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 0, 0),
                        child: Row(
                          children: [
                            const Icon(Icons.circle, size: 8, color: Colors.green),
                            4.w(),
                            "Published".bs(context, color: Colors.green)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                16.h(),
                  Row(
                    children: options.map(
                      (e) => Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: Icon(e["icon"], size: 16,),
                              ),
                              4.h(),
                              Text(e["label"], style: const TextStyle(fontSize: 12))
                            ],
                          ),
                        ),
                      )
                    ).toList()
                  )
              ],
            ),  
          )
          // 16.h(),
          // SizedBox(
          //   height: 50,
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: ElevatedButton(
          //           onPressed: (){},
          //           style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          //             elevation: const MaterialStatePropertyAll(0),
          //             backgroundColor: const MaterialStatePropertyAll(Color(0xFFf4f6fa)),
          //             foregroundColor: const MaterialStatePropertyAll(ColorConst.primary),
          //           ), 
          //           child: const Text("View"),
          //         )
          //       ),
          //       16.w(),
          //       Expanded(
          //         child: ElevatedButton(
          //           onPressed: (){}, 
          //           style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          //             elevation: const MaterialStatePropertyAll(0),
          //             backgroundColor: const MaterialStatePropertyAll(ColorConst.primaryLight),
          //             foregroundColor: const MaterialStatePropertyAll(Colors.white),
          //           ), 
          //           child: const Text("Share")
          //         )
          //       )
          //     ],
          //   ),
          // )

        ],
      ));
  }
}