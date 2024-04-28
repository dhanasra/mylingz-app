import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/network/firebase_client.dart';
import 'package:mylingz_app/network/models/user_data.dart';
import 'package:mylingz_app/utils/global.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignupEvent>(_onSignup);
    on<LoginEvent>(_onLogin);
    on<GoogleLoginEvent>(_onGoogleLogin);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseClient _client = FirebaseClient();
  
  _onSignup(SignupEvent event, Emitter emit)async{
    try{
      emit(Loading());
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password
      );
      var userId = userCredential.user?.uid;
      var data = {
        "id": userId,
        "firstName": event.fname,
        "lastName": event.lname,
        "email": event.email
      };
      await _client.userDB.doc(userId).set(data);
      Global.user = UserData.fromMap(data);
      emit(Success());
    }catch(e){
      emit(Error());
    }
  }

  _onLogin(LoginEvent event, Emitter emit)async{
    try{
      emit(Loading());
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password
      );
      var userId = userCredential.user?.uid;
      var data = (await _client.userDB.doc(userId).get()).data();
      Global.user = UserData.fromMap(data);
      emit(Success());
    }catch(e){
      emit(Error());
    }
  }

  _onGoogleLogin(GoogleLoginEvent event, Emitter emit)async{
    try{
      emit(Loading());

    }catch(e){
      emit(Error());
    }
  }

}
