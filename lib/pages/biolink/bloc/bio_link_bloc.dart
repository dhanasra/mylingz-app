import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/date_exten.dart';
import 'package:mylingz_app/network/firebase_client.dart';
import 'package:mylingz_app/network/models/biolink_design.dart';
import 'package:mylingz_app/network/models/contact_fields.dart';
import 'package:mylingz_app/network/models/form_message.dart';
import 'package:mylingz_app/network/models/social_link.dart';
import 'package:mylingz_app/utils/global.dart';

import '../../../network/models/analytics.dart';
import '../../../network/models/bio_link_button.dart';
import '../../../network/models/chart_data.dart';

part 'bio_link_event.dart';
part 'bio_link_state.dart';

class BioLinkBloc extends Bloc<BioLinkEvent, BioLinkState> {
  BioLinkBloc() : super(BioLinkInitial()) {
    on<SaveBasicInfoEvent>(_onSaveBasicInfo);
    on<SaveButtonsEvent>(_onSaveButtons);
    on<SaveSocialLinksEvent>(_onSaveSocialLinks);
    on<SaveContactFieldsEvent>(_onSaveContactFields);
    on<GetBioLinkAnalyticsEvent>(_onGetBioLinkAnalytics);
    on<UpdatePromoteEvent>(_onUpdatePromote);
    on<GetFormMessagesEvent>(_onGetFormMessages);
    on<DeleteMessagesEvent>(_onDeleteMessages);
    on<SaveDesignEvent>(_onSaveDesign);
  }

  final FirebaseClient _client =  FirebaseClient();

  _onGetBioLinkAnalytics(GetBioLinkAnalyticsEvent event, Emitter emit) async{
    try{
      emit(AnalyticsFetching());

       var snapshots = await _client.userAnalytics.collection("m/${Global.bioLink.value!.bioId}").get();
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

      List<ChartData> last7DaysAnalytics = List.generate(7, (index) {
        DateTime dayStart = today.subtract(Duration(days: index + 1));
        DateTime dayEnd = today.subtract(Duration(days: index));
        int count = 0;
        for (var doc in snapshots.docs) {
          DateTime docDateTime = DateTime.fromMillisecondsSinceEpoch(doc.data()["dateTime"]);
          if (docDateTime.isAfter(dayStart) && docDateTime.isBefore(dayEnd)) {
            count++;
          }
        }
        return ChartData(dayStart.format("dd MMM"), count.toDouble());
      });

      emit(AnalyticsFetched(
        todayClicks: todayAnalytics,
        totalClicks: analytics.length,
        device: mostCommonLocation,
        location: mostCommonDevice,
        chart: last7DaysAnalytics
      ));
    }catch(e){
      emit(Error());
    }
  }

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

  _onUpdatePromote(UpdatePromoteEvent event, Emitter emit)async{
    try{
      await _client.myBiolink.update({
        "promote": event.promote
      });
      Global.bioLink.value = Global.bioLink.value!.copyWith(
        promote: event.promote
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

  _onSaveContactFields(SaveContactFieldsEvent event, Emitter emit)async{
    try{
      await _client.myBiolink.update({"contactFields": event.fields.map((e) => e.toMap()).toList()});
      Global.bioLink.value = Global.bioLink.value!.copyWith(contactFields: event.fields);
      emit(Success());
    }catch(e){
      emit(Error());
    }
  }

  _onSaveDesign(SaveDesignEvent event, Emitter emit)async{
    try{
      await _client.myBiolink.update({"design": event.design.toMap()});
      Global.bioLink.value = Global.bioLink.value!.copyWith(design: event.design);
      emit(Success());
    }catch(e){
      emit(Error());
    }
  }

  _onGetFormMessages(GetFormMessagesEvent event, Emitter emit)async{
    emit(Loading());
    try{
      var snapshots = await _client.messagesDB.get();

      final List<FormMessage> messages = [];
      for (var shot in snapshots.docs) { 
        var data = shot.data() as Map;
        data['id'] = shot.id;
        var message = FormMessage.fromMap(data);
        messages.add(message);
      }
      emit(MessagesFetched(messages: messages));
    }catch(e){
      emit(Error());
    }
  }

  _onDeleteMessages(DeleteMessagesEvent event, Emitter emit)async{
    emit(Loading());
    try{
      await _client.messagesDB.doc(event.messageId).delete();
      emit(MessageDeleted());
    }catch(e){
      emit(Error());
    }
  }
}
