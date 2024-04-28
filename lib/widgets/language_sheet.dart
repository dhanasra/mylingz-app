import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import 'dialog_wrapper.dart';
import 'styled_button.dart';

class LanguageSheet extends StatefulWidget {
  final String value;
  final ValueChanged onSaved;
  const LanguageSheet({super.key, required this.value, required this.onSaved});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  late String selectedLanguage;

  @override
  void initState() {
    selectedLanguage = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      onSubmit: (){}, 
      header: Image.asset("res/images/language.png"), 
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Change Theme".hs(context),
            16.h(),
            RadioListTile(
              value: "en",
              groupValue: selectedLanguage,
              title: "English".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedLanguage = v;
                  }
                });
              },
            ),
            RadioListTile(
              value: "ta",
              groupValue: selectedLanguage,
              title: "தமிழ்".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedLanguage = v;
                  }
                });
              },
            ),
            RadioListTile(
              value: "hi",
              groupValue: selectedLanguage,
              title: "हिंदी".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedLanguage = v;
                  }
                });
              },
            ),
            RadioListTile(
              value: "ml",
              groupValue: selectedLanguage,
              title: "മലയാളം".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedLanguage = v;
                  }
                });
              },
            ),
            RadioListTile(
              value: "kn",
              groupValue: selectedLanguage,
              title: "ಕನ್ನಡ".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedLanguage = v;
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
                  widget.onSaved(selectedLanguage);
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