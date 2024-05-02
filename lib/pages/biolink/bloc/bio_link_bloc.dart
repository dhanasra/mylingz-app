import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/network/firebase_client.dart';
import 'package:mylingz_app/network/models/social_link.dart';
import 'package:mylingz_app/utils/global.dart';

import '../../../network/models/bio_link_button.dart';

part 'bio_link_event.dart';
part 'bio_link_state.dart';

class BioLinkBloc extends Bloc<BioLinkEvent, BioLinkState> {
  BioLinkBloc() : super(BioLinkInitial()) {
    on<SaveBasicInfoEvent>(_onSaveBasicInfo);
    on<SaveButtonsEvent>(_onSaveButtons);
    on<SaveSocialLinksEvent>(_onSaveSocialLinks);
  }

  final FirebaseClient _client =  FirebaseClient();

  _onSaveBasicInfo(SaveBasicInfoEvent event, Emitter emit)async{
    try{
      await _client.myBiolink.update({
        "title": event.title,
        "slogan": event.slogan,
        "picture": event.picture
      });
      Global.bioLink.value = Global.bioLink.value!.copyWith(
        title: event.title,
        slogan: event.slogan,
        picture: event.picture
      );
      emit(Success());
    }catch(e){
      emit(Error());
    }
  }

  _onSaveButtons(SaveButtonsEvent event, Emitter emit)async{
    try{
      await _client.myBiolink.update({"buttons": event.buttons.map((e) => e.toMap()).toList()});
      Global.bioLink.value = Global.bioLink.value!.copyWith(buttons: event.buttons);
      emit(Success());
    }catch(e){
      emit(Error());
    }
  }

  _onSaveSocialLinks(SaveSocialLinksEvent event, Emitter emit)async{
    try{
      await _client.myBiolink.update({"icons": event.links.map((e) => e.toMap()).toList()});
      Global.bioLink.value = Global.bioLink.value!.copyWith(icons: event.links);
      emit(Success());
    }catch(e){
      emit(Error());
    }
  }
}
