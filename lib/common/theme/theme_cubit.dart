import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../network/local_db.dart';
import '../../utils/global.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(Global.mode);

  void toggleTheme(ThemeMode mode)async{
    await LocalDB().saveSettings('theme', {'mode': mode.name});
    emit(mode);
  }
}
