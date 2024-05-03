import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/network/firebase_client.dart';
import 'package:mylingz_app/network/local_db.dart';
import 'package:mylingz_app/utils/global.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<DeleteAccountEvent>(_onDeleteAccount);
    on<LogoutEvent>(_onLogout);
  }

  final FirebaseClient _client = FirebaseClient();

  _onDeleteAccount(DeleteAccountEvent event, Emitter emit)async{
    try{
      emit(Loading());
      await _client.userDB.doc(_client.userId).delete();
      await _client.myBiolink.delete();
      await _client.userAnalytics.delete();
      Global.links.map((e)async => await _client.linksDB.doc(e.id).delete());
      await _client.delete();
      LocalDB().clearFavourites();
      emit(AccountDeleted());
    }catch(e){
      emit(Error());
    }
  }

  _onLogout(LogoutEvent event, Emitter emit)async{
    try{
      emit(Loading());
      await _client.logout();
      LocalDB().clearFavourites();
      emit(LoggedOut());
    }catch(e){
      emit(Error());
    }
  }
}
