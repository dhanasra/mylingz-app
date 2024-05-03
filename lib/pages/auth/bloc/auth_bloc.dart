import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mylingz_app/constants/url_const.dart';
import 'package:mylingz_app/network/firebase_client.dart';
import 'package:mylingz_app/network/models/bio_link.dart';
import 'package:mylingz_app/network/models/user_data.dart';
import 'package:mylingz_app/utils/global.dart';
import 'package:mylingz_app/utils/utils.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignupEvent>(_onSignup);
    on<LoginEvent>(_onLogin);
    on<GoogleLoginEvent>(_onGoogleLogin);
    on<GithubLoginEvent>(_onGithubLogin);
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
      var userId = userCredential.user!.uid;
      var data = {
        "id": userId,
        "firstName": event.fname,
        "lastName": event.lname,
        "email": event.email
      };
      await _client.userDB.doc(userId).set(data);
      Global.user = UserData.fromMap(data);

      var bioId = generateUniqueString();
      var bioLink = BioLink(
        title: "${event.fname} ${event.lname}", 
        bioId: bioId, 
        domainName: "${UrlConst.domainName}/m",
        id: userId
      );
      await _client.myBiolink.set(bioLink.toMap());
      Global.bioLink.value = bioLink;
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
      var biolink = (await _client.myBiolink.get()).data();
      Global.user = UserData.fromMap(data);
      Global.bioLink.value = BioLink.fromMap(biolink);
      emit(Success());
    }catch(e){
      emit(Error(msg: "Invalid login credentials."));
    }
  }

  _onGoogleLogin(GoogleLoginEvent event, Emitter emit)async{
    try{
      emit(Loading());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential? userCred = await FirebaseAuth.instance.signInWithCredential(credential);
      var user = userCred.user!;

      var userRef = await _client.userDB.doc(user.uid).get();

      if(userRef.exists){
        var biolink = (await _client.myBiolink.get()).data();
        Global.user = UserData.fromMap(userRef.data());
        Global.bioLink.value = BioLink.fromMap(biolink);
      }else{
        var names = user.displayName?.split(" ");
        var fname = names!=null && names.isNotEmpty ? names[0]: "Guest";
        var lname = names!=null && names.length>1 ? names[1]: "";

        var data = {
          "id": user.uid,
          "firstName": fname,
          "lastName": lname,
          "email": user.email,
          "picture": userCred.additionalUserInfo?.profile?["picture"]
        };
        await _client.userDB.doc(user.uid).set(data);
        Global.user = UserData.fromMap(data);

        var bioId = generateUniqueString();
        var bioLink = BioLink(
          title: "$fname $lname", 
          bioId: bioId, 
          domainName: "${UrlConst.domainName}/m",
          id: user.uid
        );
        await _client.myBiolink.set(bioLink.toMap());
        Global.bioLink.value = bioLink;
      }
      emit(Success());
    }catch(e){
      emit(Error());
    }
  }

  _onGithubLogin(GithubLoginEvent event, Emitter emit)async{
    try{
      emit(Loading());

      GithubAuthProvider githubProvider = GithubAuthProvider();

      UserCredential? userCred = await FirebaseAuth.instance.signInWithProvider(githubProvider);
      var user = userCred.user!;

      var userRef = await _client.userDB.doc(user.uid).get();

      if(userRef.exists){
        var biolink = (await _client.myBiolink.get()).data();
        Global.user = UserData.fromMap(userRef.data());
        Global.bioLink.value = BioLink.fromMap(biolink);
      }else{
        var names = user.displayName?.split(" ");
        var fname = names!=null && names.isNotEmpty ? names[0]: "Guest";
        var lname = names!=null && names.length>1 ? names[1]: "";

        var data = {
          "id": user.uid,
          "firstName": fname,
          "lastName": lname,
          "email": user.email,
          "picture": userCred.additionalUserInfo?.profile?["picture"]
        };
        await _client.userDB.doc(user.uid).set(data);
        Global.user = UserData.fromMap(data);

        var bioId = generateUniqueString();
        var bioLink = BioLink(
          title: "$fname $lname", 
          bioId: bioId, 
          domainName: "${UrlConst.domainName}/m",
          id: user.uid
        );
        await _client.myBiolink.set(bioLink.toMap());
        Global.bioLink.value = bioLink;
      }
      emit(Success());
    }catch(e){
      emit(Error());
    }
  }

}
