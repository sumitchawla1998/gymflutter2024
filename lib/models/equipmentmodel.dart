import 'package:cloud_firestore/cloud_firestore.dart';

class EquipmentModel{
  String? id;
  String? name;
  String? company;
  int? price;
  int? quantity;
  String? date;

  EquipmentModel({this.id,this.name,this.company,this.price,this.quantity,this.date});

  factory EquipmentModel.fromJson(DocumentSnapshot snapshot){
    return EquipmentModel(
      id: snapshot.id,
      name:snapshot["name"],
      company:snapshot["company"],
      price:snapshot["price"],
      quantity:snapshot["quantity"],
      date:snapshot["purchasedate"]
    );
  }

}