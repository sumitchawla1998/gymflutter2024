import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';
import 'package:gymappbysumit/components/MembershipCard.dart';
import 'package:gymappbysumit/models/membershipmodel.dart';
import 'package:gymappbysumit/services/membershiprequests.dart';
import '../models/packagemodel.dart';

class AdminViewPendingRequests extends StatefulWidget {
  const AdminViewPendingRequests({Key? key}) : super(key: key);

  @override
  State<AdminViewPendingRequests> createState() => _AdminViewPendingRequestsState();
}

class _AdminViewPendingRequestsState extends State<AdminViewPendingRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar:AppBarComponent("Pending Requests"),
        drawer: DrawerComponent(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("membershiprequests").where("status",isEqualTo: "Pending").snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(itemCount: snapshot.data?.docs.length,itemBuilder: (context,index){
                if (snapshot.hasData) {
                  if (snapshot.data.docs.length > 0) {
                    MembershipRequestsModel membershiprequests = MembershipRequestsModel.fromJson(snapshot.data?.docs[index]);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: MembershipCard(membershiprequests),
                    );
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
