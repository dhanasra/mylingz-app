import 'package:flutter/material.dart';

class SlidePicker extends StatefulWidget {
  final double? value;
  final ValueChanged onChanged;
  final IconData icon;
  const SlidePicker({super.key, this.value, required this.onChanged, required this.icon, });

  @override
  State<SlidePicker> createState() => _SlidePickerState();
}

class _SlidePickerState extends State<SlidePicker> {
  late double currentValue;

  @override
  void initState() {
    currentValue = widget.value ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Icon(widget.icon),
          Expanded(
            child: Slider(
              min: 0,
              max: 100,
              value: currentValue,
              onChanged: (v) {
                setState(() {
                  currentValue = v;
                });
                widget.onChanged(v);
              })),
        ],
      ),
    );
  }
}