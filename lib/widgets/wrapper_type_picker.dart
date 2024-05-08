import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';

class WrapperTypePicker extends StatefulWidget {
  final String? type;
  final ValueChanged onChanged;
  const WrapperTypePicker({super.key, this.type, required this.onChanged});

  @override
  State<WrapperTypePicker> createState() => _WrapperTypePickerState();
}

class _WrapperTypePickerState extends State<WrapperTypePicker> {
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
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2
      ), 
      children: [
        InkWell(
          onTap: ()=>update("outlined"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="outlined" ? 3 : 1,
                  color: selected=="outlined" ? context.theme().primaryColor : Colors.white)
            ),
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white)
              ),
            ),
          ),
        ),
        InkWell(
          onTap: ()=>update("filled"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="filled" ? 3 : 1,
                  color: selected=="filled" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
            ),
          ),
        ),
        InkWell(
          onTap: ()=>update("shadow"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="shadow" ? 3 : 1,
                  color: selected=="shadow" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: const Offset(-3, -3), color: Theme.of(context).shadowColor, blurRadius: 10)
                ]
              ),
            ),
          ),
        )
      ]);
  }
}