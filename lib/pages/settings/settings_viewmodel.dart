import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../base/base_viewmodel.dart';
import '../../common/theme/theme_cubit.dart';
import '../../constants/string_const.dart';
import '../../network/local_db.dart';
import '../../utils/utils.dart';
import '../../widgets/language_sheet.dart';
import '../../widgets/theme_sheet.dart';

class SettingsViewModel extends BaseViewModel {

  final InAppReview inAppReview = InAppReview.instance;


  rateApp(BuildContext context)async{
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }else{
      inAppReview.openStoreListing();
    }
  }

  openThemeSheet(BuildContext context){
     showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_){ 
        return ThemeSheet(
          onSave: (v){
            Future.delayed(const Duration(milliseconds: 500), (){
              context.read<ThemeCubit>().toggleTheme(v);
            });
          },
        );
      }
    );
  }

  openLanguageSheet(BuildContext context){
     showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_){ 
        return LanguageSheet(
          value: context.locale.languageCode,
          onSaved: (v){
            Future.delayed(const Duration(milliseconds: 500), (){
              LocalDB().saveSettings('language', {"code": v});
              context.setLocale(getLocale(v));
            });
          },
        );
      }
    );
  }
  
  updateSettings(key, value)async{
    await LocalDB().saveSettings(key, {'enabled': value});
  }

  recommendApp()async{
    await Share.share(StringConst.recommendContent);
  }

  sendReportOrFeedback(String type)async{
    
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@spiderlingz.com',
      query: 'subject=$type&body=Model: ${androidInfo.model}\nBrand: ${androidInfo.brand}\nAndroid Version: ${androidInfo.version.release}\nManufacturer: ${androidInfo.manufacturer}',
    );

    launchUrl(emailLaunchUri);
  }

  @override
  dispose() {

  }
}