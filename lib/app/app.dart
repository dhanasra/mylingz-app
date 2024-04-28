import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/theme/theme_cubit.dart';
import '../constants/theme_const.dart';
import '../routes/app_routes.dart';
import '../utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              supportedLocales: const [
                Locale('en', 'US'), 
                Locale('ta', 'IN'),
                Locale('ml', 'IN'),
                Locale('kn', 'IN'),
                Locale('hi', 'IN')
              ],
              onGenerateRoute: (s) => RouteGenerator(settings: s).getRoute(),
              initialRoute: Routes.splash,
              theme: ThemeConst.getApplicationTheme(false),
              darkTheme: ThemeConst.getApplicationTheme(true),
              themeMode: mode,
              builder: (context, child) {
                var lang = getLocale(context.locale.languageCode).languageCode;
                double scaleFactor = (lang == 'ta' || lang == 'ml') ? 0.9 : 1;
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(scaleFactor)),
                  child: child!,
                );
              },
            );
        },
      ),
    );
  }
}
