import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/utils/utils.dart';

class IconTypePicker extends StatefulWidget {
  final String? type;
  final ValueChanged onChanged;
  const IconTypePicker({super.key, this.type, required this.onChanged});

  @override
  State<IconTypePicker> createState() => _IconTypePickerState();
}

class _IconTypePickerState extends State<IconTypePicker> {
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
          onTap: ()=>update("colored"),
          child: Container(
            decoration: BoxDecoration(
              color: context.theme().shadowColor,
              border: Border.all(
                  width: selected=="colored" ? 3 : 1,
                  color: selected=="colored" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: Image.network(getIconUrl("colored", "facebook")),
          ),
        ),
        InkWell(
          onTap: ()=>update("outlined"),
          child: Container(
            decoration: BoxDecoration(
              color: context.theme().shadowColor,
              border: Border.all(
                  width: selected=="outlined" ? 3 : 1,
                  color: selected=="outlined" ? context.theme().primaryColor : Colors.white)
            ),
            padding: const EdgeInsets.all(8),
            child: Image.network(getIconUrl("outlined", "facebook")),
          ),
        ),
        InkWell(
          onTap: ()=>update("filled"),
          child: Container(
            decoration: BoxDecoration(
              color: context.theme().shadowColor,
              border: Border.all(
                  width: selected=="filled" ? 3 : 1,
                  color: selected=="filled" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: Image.network(getIconUrl("filled", "facebook")),
          ),
        ),
        InkWell(
          onTap: ()=>update("dotted"),
          child: Container(
            decoration: BoxDecoration(
              color: context.theme().shadowColor,
              border: Border.all(
                  width: selected=="dotted" ? 3 : 1,
                  color: selected=="dotted" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: Image.network(getIconUrl("dotted", "facebook")),
          ),
        ),
        InkWell(
          onTap: ()=>update("gradient"),
          child: Container(
            decoration: BoxDecoration(
              color: context.theme().shadowColor,
              border: Border.all(
                  width: selected=="gradient" ? 3 : 1,
                  color: selected=="gradient" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: Image.network(getIconUrl("gradient", "facebook")),
          ),
        )
      ]);
  }
}