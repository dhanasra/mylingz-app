import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/network/firebase_client.dart';
import 'package:mylingz_app/network/models/analytics.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/utils/global.dart';

part 'links_event.dart';
part 'links_state.dart';

class LinksBloc extends Bloc<LinksEvent, LinksState> {
  LinksBloc() : super(LinksInitial()) {
    on<SaveLinkEvent>(_onSaveLink);
    on<RemoveLinkEvent>(_onRemoveLink);
    on<GetLinkAnalyticsEvent>(_onGetLinkAnalytics);
  }

  final FirebaseClient _client = FirebaseClient();

  _onGetLinkAnalytics(GetLinkAnalyticsEvent event, Emitter emit) async {
    try{
      emit(AnalyticsFetching());

      var snapshots = await _client.userAnalytics.collection(event.linkId).get();
      List<Analytics> analytics = [];

      DateTime today = DateTime.now();
      DateTime todayStart = DateTime(today.year, today.month, today.day);
      DateTime todayEnd = DateTime(today.year, today.month, today.day, 23, 59, 59, 999);
      
      int todayAnalytics = 0;
      Map<String, int> locationCounts = {};
      Map<String, int> deviceCounts = {};
      for(var doc in snapshots.docs){
        var data = Analytics.fromMap(doc.data());
        analytics.add(data);
        if (data.dateTime.isAfter(todayStart) && data.dateTime.isBefore(todayEnd)) {
            todayAnalytics++;
        }

        if(data.location["city"]!=null){
          String location = data.location["city"];
          locationCounts[location] = (locationCounts[location] ?? 0) + 1;
        }

        String device = data.device;
        deviceCounts[device] = (deviceCounts[device] ?? 0) + 1;
      }

      String mostCommonLocation = locationCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      String mostCommonDevice = deviceCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      
      emit(AnalyticsFetched(
        todayClicks: todayAnalytics,
        totalClicks: analytics.length,
        device: mostCommonLocation,
        location: mostCommonDevice,
        data: analytics
      ));
    }catch(e){
      emit(Error());
    }
  }

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
