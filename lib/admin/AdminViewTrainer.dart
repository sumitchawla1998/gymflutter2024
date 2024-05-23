import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';
import 'package:gymappbysumit/components/TrainerCard.dart';
import 'package:gymappbysumit/models/trainermodel.dart';

import '../models/equipmentmodel.dart';

class AdminViewTrainer extends StatefulWidget {
  const AdminViewTrainer({Key? key}) : super(key: key);

  @override
  State<AdminViewTrainer> createState() => _AdminViewTrainerState();
}

class _AdminViewTrainerState extends State<AdminViewTrainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar:AppBarComponent("View Trainers"),
      drawer: DrawerComponent(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("trainers").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  if(snapshot.hasData){
                    if(snapshot.data.docs.length>0){
                      TrainerModel trainer =
                      TrainerModel.fromJson(snapshot.data?.docs[index]);
                      return TrainerCard(trainer);
                    }
                    else{
                      Center(child: Text("No Trainers"),);
                    }
                  }
                  return Center(child: CircularProgressIndicator(),);

                }
                );
          },
        ),
      ),
    );
  }
}
