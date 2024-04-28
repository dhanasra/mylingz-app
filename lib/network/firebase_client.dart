import 'package:cloud_firestore/cloud_firestore.dart';

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

}