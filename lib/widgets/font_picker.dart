import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';

import '../constants/data_const.dart';

class FontPicker extends StatelessWidget {
  final ValueChanged onChanged;
  const FontPicker({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<Map?> picked = ValueNotifier(null);

    return ValueListenableBuilder(
      valueListenable: picked,
      builder: (_, val, __) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: DataConst.fontFamilies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 2
          ), 
          itemBuilder: (_, idx){
            bool isSelected = DataConst.fontFamilies[idx]["name"] == picked.value?["name"];
            return InkWell(
              onTap: (){
                picked.value = DataConst.fontFamilies[idx];
                onChanged(DataConst.fontFamilies[idx]);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isSelected
                  ? context.theme().primaryColor
                  : context.theme().colorScheme.primary
                ),
                child: Text("${DataConst.fontFamilies[idx]["name"]}", 
                style: (DataConst.fontFamilies[idx]["style"] as TextStyle).copyWith(
                  fontSize: DataConst.fontFamilies[idx]["size"] as double,
                  color: Colors.white
                )),
              ),
            );
          });
      }
    );
  }
}