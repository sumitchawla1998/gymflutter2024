import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/utils/messages.dart';

import '../models/packagemodel.dart';
import '../services/membershiprequests.dart';
class JoiningCard extends StatelessWidget {
  PackageModel package;
  JoiningCard(this.package);

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Card(
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
                  "Package : ${package.name}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Container(height: 2,width :160, decoration: BoxDecoration(color: Colors.white),margin: EdgeInsets.symmetric(vertical: 8),),
                Text(
                  "Duration : ${package.duration}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Price : ${package.price}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        // FirebaseAuth auth = FirebaseAuth.instance;
                        int? l = await MembershipRequests().addjoiningrequest(auth.currentUser!.uid,auth.currentUser!.displayName, auth.currentUser!.email, package.name, package.price, package.duration, "Pending");

                        if(l == 1){
                          success(context, "Please check your joining requests status", Colors.green);
                        }else{
                          success(context, "Thank your for sending joining requests", Colors.green);
                        }

                      },
                      child: Text(
                        "Join",
                        style: TextStyle(fontSize: 17),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xffFF7757)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 17),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xffFF7757)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
