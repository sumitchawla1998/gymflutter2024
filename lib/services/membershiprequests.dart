import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymappbysumit/utils/messages.dart';

class MembershipRequests{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<int?> addjoiningrequest(String? uid,String? displayname,String? email,String? name,int? price,String? duration,String? status)async{

    QuerySnapshot? snapshot = await firestore.collection("membershiprequests").where("uid",isEqualTo: uid).get();
    if(snapshot.docs.length>0){
      return snapshot.docs.length;
    }else{
      try{
        await firestore.collection("membershiprequests").add({
          "uid":uid,
          "displayname":displayname,
          "email":email,
          "name":name,
          "price":price,
          "duration":duration,
          "status":status,
        });
      }catch(e){
        print(e);
      }
    }

  }
  Future approvedjoiningrequests(String? id)async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try{
      await firestore.collection("membershiprequests").doc(id).update({"status":"Approved"});
    }catch(e){
      print(e);
    }
  }

  Future rejectjoiningrequests(String? id)async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try{
      await firestore.collection("membershiprequests").doc(id).update({"status":"Rejected"});
    }catch(e){
      print(e);
    }
  }
}