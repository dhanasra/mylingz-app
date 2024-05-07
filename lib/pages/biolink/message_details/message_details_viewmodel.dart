import 'package:mylingz_app/base/base_viewmodel.dart';

import '../../../network/models/form_message.dart';

class MessageDetailsViewModel extends BaseViewModel {
  final FormMessage message;

  MessageDetailsViewModel(this.message);
  
  @override
  dispose() {

  }
}