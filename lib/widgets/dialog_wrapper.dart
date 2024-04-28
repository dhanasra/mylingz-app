import 'dart:ui';

import 'package:flutter/material.dart';

import 'bottomsheet_close.dart';

class DialogWrapper extends StatelessWidget {
  final Widget header;
  final Widget child;
  final double? bottomMargin;
  final VoidCallback onSubmit;
  const DialogWrapper({super.key, this.bottomMargin, required this.child, required this.header, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: header,
                )),
              const SizedBox(
                height: 40,),
              // Expanded(child: Container(),),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 0), blurRadius: 30, color: Color(0x1a000000)
                    )
                  ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    child
                  ],
                ),
              ),
              const Expanded(child: BottomsheetClose()),
            ],
          ),
        ],
      ),
    );
  }
}