
import 'package:cloud_firestore/cloud_firestore.dart';

class EquipmentService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future addequipment(String name,String company,int price,int quantity,String date) async {
    try{
      await firestore.collection("equipments").add({"name":name,"company":company,"price":price,"quantity":quantity,"purchasedate":date});
    }catch(e){
      print(e);
    }


  }
  Future deleteEquipment(String? id)async{
    try{
      await firestore.collection("equipmrnts").doc(id).delete();
    }catch(e){
      print(e);
    }
  }

  Future UpdateEquipment (String id, String name, int price, String company, int quantity,String date)async{
    try{
      await firestore.collection('equipments').doc(id).update({
        'name':name,
        'price':price,
        'company':company,
        'quantity':quantity,
        'date':date,
      });
    }catch(e) {
      print(e);
    }
    }

}