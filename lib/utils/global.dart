import 'package:flutter/material.dart';
import 'package:mylingz_app/network/models/short_link.dart';

import '../network/models/bio_link.dart';
import '../network/models/user_data.dart';

class Global {
  
  static ThemeMode mode = ThemeMode.light;

  static UserData? user;
  static BioLink? bioLink;

  static List<ShortLink> links = [];

}