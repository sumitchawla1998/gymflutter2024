import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';

import '../components/MembershipCard.dart';
import '../models/membershipmodel.dart';
import '../models/packagemodel.dart';
class AdminViewRejectedRequests extends StatefulWidget {
  const AdminViewRejectedRequests({Key? key}) : super(key: key);

  @override
  State<AdminViewRejectedRequests> createState() => _AdminViewRejectedRequestsState();
}

class _AdminViewRejectedRequestsState extends State<AdminViewRejectedRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBarComponent("Rejected Requests"),
        drawer: DrawerComponent(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("membershiprequests").where("status",isEqualTo: "Rejected").snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(itemCount: snapshot.data?.docs.length,itemBuilder: (context,index){
                if (snapshot.hasData) {
                  if (snapshot.data.docs.length > 0) {
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
        ));;
  }
}
