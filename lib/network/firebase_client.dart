import 'package:cloud_firestore/cloud_firestore.dart';

class Collection {
  static const String users = 'USERS';
  static const String config = 'config';
}

class FirebaseClient {
  
  final firestore = FirebaseFirestore.instance;

  CollectionReference get userDB => firestore.collection(Collection.users);
  CollectionReference get configDB => firestore.collection(Collection.config);

}