import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'network/local_db.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBmpsYKnK8K6iZmdkg-4e5PvDR7kxVwh6c", 
      appId: "1:834343356980:android:3c66537fbb6ffc2e321861", 
      messagingSenderId: "834343356980", 
      projectId: "mylingz",
      storageBucket: "mylingz.appspot.com"
    )
  );

  try{
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    remoteConfig.getString('data');
  }catch(error){}

  await LocalDB.init();
  var currentLocale =  await LocalDB().getLangcode();

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'), 
      Locale('ta', 'IN'),
      Locale('ml', 'IN'),
      Locale('kn', 'IN'),
      Locale('hi', 'IN')
    ],
    path: 'res/translations',
    fallbackLocale: currentLocale,
    child: const App()));
}