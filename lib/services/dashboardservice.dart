import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<int> getCount(String collection,[String? status])async{
    QuerySnapshot snapshot;
    if(status == null){
      snapshot = await firestore.collection(collection).get();
    }
    else{
      snapshot = await firestore.collection(collection).where("status",isEqualTo:status).get();
    }

    return snapshot.docs.length;
  }


}