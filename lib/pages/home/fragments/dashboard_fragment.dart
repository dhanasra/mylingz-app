import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

class DashboardFragment extends StatelessWidget {
  const DashboardFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
      children: [
        "CREATED LINKS".ts(context),
      ],
    );
  }
} 