import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../common/theme/theme_cubit.dart';
import 'dialog_wrapper.dart';
import 'styled_button.dart';

class ThemeSheet extends StatefulWidget {
  final ValueChanged onSave;
  const ThemeSheet({super.key, required this.onSave});

  @override
  State<ThemeSheet> createState() => _ThemeSheetState();
}

class _ThemeSheetState extends State<ThemeSheet> {
  late ThemeMode selectedTheme;

  @override
  void initState() {
    selectedTheme = context.read<ThemeCubit>().state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      onSubmit: (){}, 
      header: Image.asset("res/images/theme.png"), 
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Change Theme".hs(context),
            16.h(),
            RadioListTile(
              value: ThemeMode.light,
              groupValue: selectedTheme,
              title: "Light Theme".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedTheme = v;
                  }
                });
              },
            ),
            RadioListTile(
              value: ThemeMode.dark,
              groupValue: selectedTheme,
              title: "Dark Theme".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedTheme = v;
                  }
                });
              },
            ),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: selectedTheme,
              title: "System Theme".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedTheme = v;
                  }
                });
              },
            ),
            16.h(),
            Align(
              alignment: Alignment.center,
              child: StyledButton(
                w: 160,
                rounded: true,
                onClick: (){
                  context.back();
                  widget.onSave(selectedTheme);
                }, 
                text: "SAVE"
              )
            )
          ],
        ),
      )
    );
  }
}