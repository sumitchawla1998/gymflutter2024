import 'package:cloud_firestore/cloud_firestore.dart';

class TrainerModel{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? id;
  String? name;
  String? email;
  String? address;
  String? mobile;
  String? joindate;
  int? salary;

  TrainerModel({this.id,this.name,this.email,this.address,this.mobile,this.joindate,this.salary});

  factory TrainerModel.fromJson(DocumentSnapshot snapshot){
    return TrainerModel(
        id: snapshot.id,
        name: snapshot["name"],
        email: snapshot["email"],
        address: snapshot["address"],
        mobile: snapshot["mobile"],
        joindate: snapshot["joindate"],
        salary: snapshot["salary"],
    );
  }
}