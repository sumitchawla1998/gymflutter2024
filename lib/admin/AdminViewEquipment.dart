import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';
import 'package:gymappbysumit/components/EquipmentCard.dart';
import 'package:gymappbysumit/models/equipmentmodel.dart';

class AdminViewEquipments extends StatefulWidget {
  const AdminViewEquipments({Key? key}) : super(key: key);

  @override
  State<AdminViewEquipments> createState() => _AdminViewEquipmentsState();
}

class _AdminViewEquipmentsState extends State<AdminViewEquipments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBarComponent("View Equipments"),
        drawer: DrawerComponent(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("equipments").snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.docs.length > 0) {
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        EquipmentModel equipment =
                            EquipmentModel.fromJson(snapshot.data?.docs[index]);
                        return EquipmentCard(equipment);
                      });
                } else {
                  return Center(
                    child: Text("No Equipments"),
                  );
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
