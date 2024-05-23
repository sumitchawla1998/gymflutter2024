import 'package:flutter/material.dart';
import 'package:gymappbysumit/admin/AdminEditEquipment.dart';
import 'package:gymappbysumit/models/equipmentmodel.dart';
import 'package:gymappbysumit/services/equipmentservice.dart';
class EquipmentCard extends StatelessWidget {
  EquipmentModel equipment;
  EquipmentCard(this.equipment);

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
              child: Image(
                  image: AssetImage("images/plan.png")),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Name : ${equipment.name}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Company : ${equipment.company}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Price : ${equipment.price}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Purchase : ${equipment.date}",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Quantity : ${equipment.quantity}",
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminEditEquipment(equipment),));
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(fontSize: 17),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor:
                          Color(0xffFF7757)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        EquipmentService().deleteEquipment(equipment.id);
                      },
                      child: Text(
                        "Delete",
                        style: TextStyle(fontSize: 17),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor:
                          Color(0xffFF7757)),
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
