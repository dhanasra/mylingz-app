import 'package:mylingz_app/base/base_viewmodel.dart';

import '../../../network/models/form_message.dart';

class MessagesViewModel extends BaseViewModel {

  List<FormMessage> messages = [];

  @override
  dispose() {

  }

}