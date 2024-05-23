import 'package:cloud_firestore/cloud_firestore.dart';
class PackageService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
    Future addpackage(String name,int price,String duration) async {
      try{
        await firestore.collection("packages").add({
          "name":name,
          "price":price,
          "duration":duration
        });
      }catch(e){
        print(e);
      }
  }

  Future updatepackage(String id,String name,int price,String duration) async {
      print(price);
    try{
      await firestore.collection("packages").doc(id).update({
        "name":name,
        "price":price,
        "duration":duration
      });
    }catch(e){
      print(e);
    }
  }


  Future deletepackage(String? id)async{
      try{
        await firestore.collection("packages").doc(id).delete();
      }catch(e){
        print(e);
      }
  }
}