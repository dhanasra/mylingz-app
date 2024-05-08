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
      children: [
        InkWell(
          onTap: ()=>update("left"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="left" ? 3 : 1,
                  color: selected=="left" ? context.theme().primaryColor : Colors.white)
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.format_align_left_outlined, size: 28, color: Colors.black),
          ),
        ),
        InkWell(
          onTap: ()=>update("center"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="center" ? 3 : 1,
                  color: selected=="center" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.format_align_center_outlined, size: 28, color: Colors.black),
          ),
        ),
        InkWell(
          onTap: ()=>update("right"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="right" ? 3 : 1,
                  color: selected=="right" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.format_align_right_outlined, size: 28, color: Colors.black,),
          ),
        ),
      ]);
  }
}