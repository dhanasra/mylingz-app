import 'package:flutter/material.dart';

String? colorToString(Color? color) {
    if(color==null){
      return null;
    }
    return 'Color(0x${color.value.toRadixString(16).padLeft(8, '0')})';
}

Color? stringToColor(String? colorString) {
  if(colorString==null){
    return null;
  }
  String hexString = colorString.substring(8, 16);
  int colorValue = int.parse(hexString, radix: 16);
  return Color(colorValue);
}

Locale getLocale(String languageCode){
  switch(languageCode){
    case "en": return const Locale("en", "US");
    case "ta": return const Locale("ta", "IN");
    case "ml": return const Locale("ml", "IN");
    case "kn": return const Locale("kn", "IN");
    case "hi": return const Locale("hi", "IN");
    default: return const Locale("en", "US");
  }
}

String getLanguage(String languageCode){
  switch(languageCode){
    case "en": return "ENGLISH";
    case "ta": return "தமிழ்";
    case "ml": return "മലയാളം";
    case "kn": return "ಕನ್ನಡ";
    case "hi": return "हिंदी";
    default: return "ENGLISH";
  }
}