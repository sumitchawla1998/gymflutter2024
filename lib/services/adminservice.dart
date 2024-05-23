import 'package:cloud_firestore/cloud_firestore.dart';

class AdminService{
  Future login(String unm,String pwd) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try{
      QuerySnapshot snapshot= await firestore.collection("admins").where("unm",isEqualTo: unm).where("pwd",isEqualTo: pwd).get();
      return snapshot.docs.length;
    }catch(e){
      print(e);
    }

  }
}