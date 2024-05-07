import 'package:easy_localization/easy_localization.dart';

extension DateExtensions on DateTime {

  String format(String format){
    return DateFormat(format).format(this);
  }
}
