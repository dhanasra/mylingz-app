import 'dart:ui';

import 'package:flutter/material.dart';

class DrawerDialog extends StatelessWidget {
  final Widget child;
  const DrawerDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                child
              ],
            )
          ]
        )
      ),
    );
  }
}