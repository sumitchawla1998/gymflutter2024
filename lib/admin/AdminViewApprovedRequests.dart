import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';
import 'package:gymappbysumit/components/MembershipCard.dart';

import '../models/membershipmodel.dart';
import '../models/packagemodel.dart';
class AdminViewApprovedRequests extends StatefulWidget {
  const AdminViewApprovedRequests({Key? key}) : super(key: key);

  @override
  State<AdminViewApprovedRequests> createState() => _AdminViewApprovedRequestsState();
}

class _AdminViewApprovedRequestsState extends State<AdminViewApprovedRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBarComponent("Approved Requests"),
        drawer: DrawerComponent(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("membershiprequests").where("status",isEqualTo: "Approved").snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(itemCount: snapshot.data?.docs.length,itemBuilder: (context,index){
                if (snapshot.hasData) {
                  if (snapshot.data?.docs.length > 0) {
                    MembershipRequestsModel membershiprequests = MembershipRequestsModel.fromJson(snapshot.data?.docs[index]);
                    return MembershipCard(membershiprequests);
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
