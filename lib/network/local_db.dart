import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../utils/global.dart';
import '../utils/utils.dart';

class LocalDB {

  static CollectionBox? history;
  static CollectionBox? settings;

  static init()async{
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter();
    final boxCollection = await BoxCollection.open(
      'MYLingz', 
      {'settings'}, 
      path: appDocDirectory.path
    );
    settings = await boxCollection.openBox<Map>('settings');
    var data = await settings?.getAllValues();
    Global.mode = ThemeMode.values.firstWhere((element) => element.name == data?['theme']?['mode'], orElse: ()=>ThemeMode.light);
  }

  Future<void> saveSettings(key, value) async =>await settings?.put(key, value);

  Future<Locale> getLangcode()async{
    var data = await settings?.getAllValues();
    var languageCode = data?['language']?['code']??"en";
    return getLocale(languageCode);
  }

}