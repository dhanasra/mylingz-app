import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/network/firebase_client.dart';
import 'package:mylingz_app/utils/global.dart';

part 'bio_link_event.dart';
part 'bio_link_state.dart';

class BioLinkBloc extends Bloc<BioLinkEvent, BioLinkState> {
  BioLinkBloc() : super(BioLinkInitial()) {
    on<SaveBasicInfoEvent>(_onSaveBasicInfo);
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
}
