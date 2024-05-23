import 'package:flutter/material.dart';
import 'package:gymappbysumit/admin/AdminEditTrainer.dart';
import 'package:gymappbysumit/models/trainermodel.dart';
import 'package:gymappbysumit/services/trainerservice.dart';
import 'package:gymappbysumit/utils/messages.dart';
class TrainerCard extends StatelessWidget {
  TrainerModel trainer;
  TrainerCard(this.trainer);

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
              width: 130,
              child: Image.asset("images/trainer.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Name : ${trainer.name}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Email: ${trainer.email}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Mobile : ${trainer.mobile}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Address : ${trainer.address}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Join Date : ${trainer.joindate}",
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminEditTrainer(trainer),));
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
                      onPressed: () {
                        TrainerService().deleteTrainer(trainer.id);
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
