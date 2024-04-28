import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mylingz_app/network/models/short_link.dart';
import 'package:mylingz_app/network/models/user_data.dart';
import 'package:mylingz_app/utils/global.dart';

class Collection {
  static const String users = 'USERS';
  static const String links = 'LINKS';
  static const String config = 'config';
}

class FirebaseClient {
  
  final firestore = FirebaseFirestore.instance;

  CollectionReference get userDB => firestore.collection(Collection.users);
  CollectionReference get linksDB => firestore.collection(Collection.links);

  CollectionReference get configDB => firestore.collection(Collection.config);

  Future initApp(User? user)async{
    if(user!=null){
      var userId = user.uid;
      var data = await Future.wait([
        FirebaseClient().userDB.doc(userId).get(),
        firestore.collection(Collection.links).where("createdBy", isEqualTo: userId).get()
      ]);

      var userInfo = (data[0] as DocumentSnapshot).data();
      var linkSnapShots = data[1] as QuerySnapshot;
      List<ShortLink> links = [];
      for (QueryDocumentSnapshot doc in linkSnapShots.docs) {
        var data = doc.data() as Map;
        data["id"] = doc.id;
        links.add(ShortLink.fromMap(data));
      } 

      Global.links = links;
      Global.user = UserData.fromMap(userInfo);
    } 
  }

}