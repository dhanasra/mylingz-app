import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';

class DottedWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onClick;
  const DottedWrapper({super.key, required this.child, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(8),
        color: Colors.lightBlue[300]!,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.theme().colorScheme.background.withOpacity(0.7)
          ),
          child: child,
        )
      ),
    );
  }
}