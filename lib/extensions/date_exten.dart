import 'package:easy_localization/easy_localization.dart';

extension DateExtensions on DateTime {

  format(String format){
    return DateFormat(format).format(this);
  }
}
