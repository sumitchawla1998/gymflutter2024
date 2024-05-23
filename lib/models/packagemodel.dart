import 'package:cloud_firestore/cloud_firestore.dart';

class PackageModel{
  String? id;
  String? name;
  int? price;
  String? duration;

  PackageModel({this.id,this.name,this.price,this.duration});

  factory PackageModel.fromJson(DocumentSnapshot snapshot){
    return PackageModel(
      id : snapshot.id,
      name : snapshot["name"],
      price : snapshot["price"],
      duration : snapshot["duration"],
    );
  }
}