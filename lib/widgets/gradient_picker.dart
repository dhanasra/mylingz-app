import 'package:flutter/material.dart';

import '../constants/color_const.dart';

class GradientPicker extends StatelessWidget {
  final ValueChanged onChanged;
  final String? value;
  const GradientPicker({super.key, required this.onChanged, this.value});

  @override
  Widget build(BuildContext context) {

    ValueNotifier<String?> picked = ValueNotifier(value);

    return ValueListenableBuilder(
      valueListenable: picked,
      builder: (_, val, __) {
        return SizedBox(
          height: 45,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: ColorConst.gradients.keys.map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        picked.value = e;
                        onChanged(e);
                      },
                      child: Container(
                        width: 45, height: 45,
                        decoration: BoxDecoration(
                          gradient: ColorConst.gradients[e],
                          borderRadius: BorderRadius.circular(6)
                        ),
                      ),
                    ),

                    Visibility(
                      visible: val==e,
                      child: InkWell(
                        onTap: (){
                          picked.value = null;
                          onChanged(null);
                        },
                        child: Container(
                          width: 45, height: 45,
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)
                          ),
                          child: const Icon(Icons.check, color: Colors.white),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              )).toList()
          ),
        );
      }
    );
  }
}