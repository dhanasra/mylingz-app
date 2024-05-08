import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';

class LayoutPicker extends StatefulWidget {
  final String? type;
  final ValueChanged onChanged;
  const LayoutPicker({super.key, this.type, required this.onChanged});

  @override
  State<LayoutPicker> createState() => _LayoutPickerState();
}

class _LayoutPickerState extends State<LayoutPicker> {
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
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.8
      ), 
      children: [
        InkWell(
          onTap: ()=>update("layout1"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="layout1" ? 3 : 1,
                  color: selected=="layout1" ? context.theme().primaryColor : Colors.white)
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(),
                8.h(),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.white,
                ),
                4.h(),
                Container(
                  height: 10,
                  width: 130,
                  color: Colors.white,
                ),
              ],
            )
          ),
        ),
        InkWell(
          onTap: ()=>update("layout2"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="layout2" ? 3 : 1,
                  color: selected=="layout2" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(),
                8.h(),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.white,
                ),
                4.h(),
                Container(
                  height: 10,
                  width: 130,
                  color: Colors.white,
                ),
              ],
            )
          ),
        ),
        InkWell(
          onTap: ()=>update("layout3"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="layout3" ? 3 : 1,
                  color: selected=="layout3" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(),
                8.h(),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.white,
                ),
                4.h(),
                Container(
                  height: 10,
                  width: 130,
                  color: Colors.white,
                ),
              ],
            )
          ),
        ),
        InkWell(
          onTap: ()=>update("layout4"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="layout4" ? 3 : 1,
                  color: selected=="layout4" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(),
                8.w(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 16,
                        width: 60,
                        color: Colors.white,
                      ),
                      4.h(),
                      Container(
                        height: 16,
                        width: 130,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
        )
      ]);
  }
}