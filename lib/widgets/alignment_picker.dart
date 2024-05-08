import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';

class AlignmentPicker extends StatefulWidget {
  final String? type;
  final ValueChanged onChanged;
  const AlignmentPicker({super.key, this.type, required this.onChanged});

  @override
  State<AlignmentPicker> createState() => _AlignmentPickerState();
}

class _AlignmentPickerState extends State<AlignmentPicker> {
  String? selected;

  @override
  void initState() {
    selected = widget.type;
    super.initState();
  }

  update(String type){
    setState(()=>selected=type);
    widget.onChanged(type);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.5
      ), 
      children: ["left", "center", "right"].map(
        (e) => InkWell(
          onTap: ()=>update(e),
          child: Container(
            decoration: BoxDecoration(
              color: context.theme().shadowColor,
              border: Border.all(
                  width: selected==e ? 3 : 1,
                  color: selected==e ? context.theme().primaryColor : Colors.white)
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              e == "left"
                ? Icons.format_align_left_outlined
                : e== "center"
                ? Icons.format_align_center_outlined
                : Icons.format_align_right_outlined, size: 28, color: Colors.black),
          ),
        )).toList());
  }
}