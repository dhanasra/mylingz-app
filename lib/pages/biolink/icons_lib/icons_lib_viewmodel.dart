import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/utils/global.dart';

import '../../../network/models/social_icon.dart';

class IconsLibViewModel extends BaseViewModel {
  late List<SocialIcon> socialIcons;
  late List<SocialIcon> communicationIcons;

  IconsLibViewModel(){
    socialIcons = Global.icons.where((e) => e.category=="Social").toList();
    communicationIcons = Global.icons.where((e) => e.category=="Communication").toList();

  }

  
  @override
  dispose() {

  }
}