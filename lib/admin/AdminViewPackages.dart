import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/admin/AdminEditPackage.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';
import 'package:gymappbysumit/components/PackageCard.dart';
import 'package:gymappbysumit/models/packagemodel.dart';
import 'package:gymappbysumit/services/packageservice.dart';

class AdminViewPackages extends StatefulWidget {
  const AdminViewPackages({Key? key}) : super(key: key);

  @override
  State<AdminViewPackages> createState() => _AdminViewPackagesState();
}

class _AdminViewPackagesState extends State<AdminViewPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBarComponent("View Packages"),
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
                    return PackageCard(package);
                  }else{
                    return Center(child: Text("No Packages"),);
                  }
                }

                  return Center(child: CircularProgressIndicator(),);

              });
            },
          ),
        ));
  }
}
