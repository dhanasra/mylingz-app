import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/network/firebase_client.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/utils/global.dart';

part 'links_event.dart';
part 'links_state.dart';

class LinksBloc extends Bloc<LinksEvent, LinksState> {
  LinksBloc() : super(LinksInitial()) {
    on<SaveLinkEvent>(_onSaveLink);
    on<RemoveLinkEvent>(_onRemoveLink);
  }

  final FirebaseClient _client = FirebaseClient();

  _onSaveLink(SaveLinkEvent event, Emitter emit) async {
    try{
      emit(Loading());
      var data = {
        "url": event.url,
        "short": event.short,
        "domain": event.domain,
        "title": event.title,
        "bioLink": event.isBioLink,
        "bioLinkBtnLabel": event.btnLabel,
        "createdBy": Global.user!.id,
        "createdAt": DateTime.now().millisecondsSinceEpoch
      };

      if(event.id!=null){
        await _client.linksDB.doc(event.id).update(data);
        data["id"] = event.id;
        Global.links = Global.links.map((e){
          if(e.id == event.id){
            return ShortLink.fromMap(data);
          }else{
            return e;
          }
        }).toList();
      }else{
        DocumentReference ref = await _client.linksDB.add(data);
        data["id"] = ref.id; 
        Global.links.add(ShortLink.fromMap(data));
      }

      emit(Success());
    }catch(e){
      emit(Error());
    }
  }

  _onRemoveLink(RemoveLinkEvent event, Emitter emit) async {
    try{
      emit(Loading());
      await _client.linksDB.doc(event.id).delete();
      Global.links.removeWhere((e)=>e.id==event.id);
      emit(Deleted());
    }catch(e){
      emit(Error());
    }
  }
}
