import 'package:flutter/material.dart';
import 'package:gymappbysumit/models/packagemodel.dart';
import 'package:gymappbysumit/services/packageservice.dart';
import 'package:gymappbysumit/utils/messages.dart';

import '../admin/AdminEditPackage.dart';
class PackageCard extends StatelessWidget {
  PackageModel package;
  PackageCard(this.package);

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
              width: 140,
              child:
              Image(image: AssetImage("images/plan.png")),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Plan : ${package.name}",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Duration : ${package.duration}",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Price : ${package.price}",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminEditPackage(package)));
                      },
                      child: Text(
                        "Update",
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
                      onPressed: () async {
                        PackageService().deletepackage(package.id);

                        success(context, "Package Deleted", Colors.red);

                      },
                      child: Text(
                        "Delete",
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
