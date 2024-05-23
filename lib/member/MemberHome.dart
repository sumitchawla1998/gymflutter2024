import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';
import 'package:gymappbysumit/components/JoiningCard.dart';
import 'package:gymappbysumit/components/PackageCard.dart';
import 'package:gymappbysumit/models/packagemodel.dart';
import 'package:gymappbysumit/services/membershiprequests.dart';

class MemberHome extends StatefulWidget {
  const MemberHome({Key? key}) : super(key: key);

  @override
  State<MemberHome> createState() => _MemberHomeState();
}

class _MemberHomeState extends State<MemberHome> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar:AppBarComponent("All Packages"),
        drawer: DrawerComponent(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("packages").snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(itemCount: snapshot.data?.docs.length,itemBuilder: (context,index){
                if (snapshot.hasData) {
                  if (snapshot.data?.docs.length > 0) {
                    PackageModel package = PackageModel.fromJson(snapshot.data?.docs[index]);
                    return JoiningCard(package);
                  }else{
                    return Center(child: Text("No Packages"),);
                  }
                }
                else{
                  return Center(child: CircularProgressIndicator(),);
                }
              });
            },
          ),
        ));
  }
}
