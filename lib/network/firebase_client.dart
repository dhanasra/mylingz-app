import 'package:cloud_firestore/cloud_firestore.dart';

class Collection {
  static const String config = 'config';
}

class FirebaseClient {
  
  final firestore = FirebaseFirestore.instance;

  CollectionReference get configDB => firestore.collection(Collection.config);

}