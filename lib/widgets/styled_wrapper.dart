import 'package:flutter/material.dart';

class StyledWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? m;
  final EdgeInsets? p;
  final double? r;
  final VoidCallback? onClick;
  final Alignment? align;
  const StyledWrapper({super.key, required this.child, this.m, this.p, this.onClick, this.r, this.align});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: m,
        alignment: align,
        padding: p,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r ?? 8),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(offset: const Offset(-3, -3), color: Theme.of(context).shadowColor, blurRadius: 10),
            BoxShadow(offset: const Offset(3, 3), color: Theme.of(context).shadowColor, blurRadius: 10)
          ]
        ),
        child: child
      ),
    );
  }
}