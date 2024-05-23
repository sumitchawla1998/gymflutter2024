import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MembershipRequestsModel{
  String? id;
  String? displayname;
  String? email;
  String? name;
  int? price;
  String? duration;
  String? status;

  MembershipRequestsModel({this.id,this.displayname,this.email,this.name,this.price,this.duration,this.status});

  factory MembershipRequestsModel.fromJson(DocumentSnapshot snapshot){
    return MembershipRequestsModel(
      id:snapshot.id,
      displayname:snapshot["displayname"],
      email:snapshot["email"],
      name:snapshot["name"],
      price:snapshot["price"],
      duration:snapshot["duration"],
      status:snapshot["status"],
    );
  }
}