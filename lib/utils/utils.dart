import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mylingz_app/utils/global.dart';

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
    case "bn": return const Locale("bn", "IN"); 
    case "pt": return const Locale("pt", "BR"); 
    case "ur": return const Locale("ur", "PK"); 
    case "ar": return const Locale("ar", "SA");
    case "my": return const Locale("my", "MM");
    case "gu": return const Locale("gu", "IN"); 
    case "fr": return const Locale("fr", "FR");
    case "de": return const Locale("de", "DE");
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
    case "ar": return "العربية";
    case "bn": return "বাংলা";
    case "pt": return "Português";
    case "de": return "Deutsch";
    case "fr": return "Français";
    case "my": return "မြန်မာ";
    case "ur": return "اردو";
    case "gu": return "ગુજરાતી";
    default: return "ENGLISH";
  }
}
String generateUniqueString() {
  String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  String randomChars = generateRandomChars(4);
  String uniqueString = timestamp.substring(timestamp.length - 4) + randomChars;
  return uniqueString;
}

String generateRandomChars(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
}

IconData getDeviceIcon(String device){
  if(device == "Android"){
    return Icons.android;
  }else if(device == "iPad"){
    return Icons.tablet_android;
  }else if(device == "iPod"){
    return Icons.tablet_mac;
  }else if(device == "iOS"){
    return Icons.apple;
  }else if(device == "Mobile"){
    return Icons.phone_android;
  }else if(device == "Tablet"){
    return Icons.tablet_outlined;
  }else{
    return Icons.web_asset_rounded;
  }
}

String getIconUrl(String type, String icon){
  return "${Global.storageDomain}/icons%2F$type%2F$icon.png?alt=media";
}