import 'package:flutter/material.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/network/models/social_icon.dart';

import '../network/models/bio_link.dart';
import '../network/models/user_data.dart';

class Global {
  
  static ThemeMode mode = ThemeMode.light;

  static UserData? user;
  static ValueNotifier<BioLink?> bioLink = ValueNotifier(null);

  static List<ShortLink> links = [];
  static ValueNotifier<List<ShortLink>> favourites = ValueNotifier([]);
  static List<SocialIcon> icons = [];

  static String storageDomain = "https://firebasestorage.googleapis.com/v0/b/mylingz.appspot.com/o";

}