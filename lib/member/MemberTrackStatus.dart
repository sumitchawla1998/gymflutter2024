import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';
import 'package:gymappbysumit/components/JoiningCard.dart';
import 'package:gymappbysumit/models/membershipmodel.dart';
import 'package:gymappbysumit/services/activepackageserice.dart';
import 'package:gymappbysumit/services/trackstatusservice.dart';
class MemberTrackStatus extends StatefulWidget {
  const MemberTrackStatus({Key? key}) : super(key: key);

  @override
  State<MemberTrackStatus> createState() => _MemberTrackStatusState();
}

class _MemberTrackStatusState extends State<MemberTrackStatus> {

  MembershipRequestsModel? membershipRequestsModel;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPackageStatus();
  }

  Future<MembershipRequestsModel?> fetchPackageStatus() async {
    DocumentSnapshot documentSnapshot = await TrackStatusService().getPackageStatus(auth.currentUser!.uid);
    setState(() {
      membershipRequestsModel = MembershipRequestsModel.fromJson(documentSnapshot);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBarComponent("Track Status"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Color(0xffFF7757),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 14, left: 10, right: 10),
                    // height: 150,
                    width: 150,
                    child:
                    Image(image: AssetImage("images/plan.png")),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Package : ${membershipRequestsModel?.name}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(height: 2,width :160, decoration: BoxDecoration(color: Colors.white),margin: EdgeInsets.symmetric(vertical: 8),),
                      Text(
                        "Duration : ${membershipRequestsModel?.duration}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Price : ${membershipRequestsModel?.price}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Status : ${membershipRequestsModel?.status}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xffFF7757)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
