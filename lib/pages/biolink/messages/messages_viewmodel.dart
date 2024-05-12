import 'package:flutter/material.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/constants/assets_const.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../../../network/models/form_message.dart';

class MessagesViewModel extends BaseViewModel {

  List<FormMessage> messages = [];


  List<PopupMenuEntry> getMenuItem(BuildContext context){
    return [
      PopupMenuItem<String>(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        value: 'csv',
        child: Row(
          children: [
            Image.asset(AssetsConst.csv, width: 28),
            24.w(),
            "Download as CSV".ts(context)
          ],
        ),
      ),
      PopupMenuItem<String>(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        value: 'excel',
        child: Row(
          children: [
            Image.asset(AssetsConst.excel, width: 28),
            24.w(),
            "Download as Excel".ts(context)
          ],
        ),
      ),
    ];
  }

  @override
  dispose() {

  }

}