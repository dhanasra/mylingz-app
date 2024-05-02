import 'package:flutter/material.dart';

class SingleSelect extends StatelessWidget {
  final List<String> items;
  final String value;
  final ValueChanged onChanged;
  final IconData? prefixIcon;
  const SingleSelect({super.key, required this.items, required this.value, required this.onChanged, this.prefixIcon});

  @override
  Widget build(BuildContext context) {

    ValueNotifier notifier = ValueNotifier<String?>(value);

    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (_, value, __) {
        return DropdownButtonFormField<String>(
          value: notifier.value,
          decoration: InputDecoration(
            hintText: "enter",
            prefixIcon: prefixIcon!=null ? Icon(prefixIcon): null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          style: Theme.of(context).textTheme.titleMedium,
          onChanged: (v) {
            notifier.value = v;
            onChanged(v);
          },
          selectedItemBuilder: (context) => items.map((e) => Text(e)).toList(),
          items: items.map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(e)),
            ),
          ).toList(),
          
        );
      }
    );
  }
}