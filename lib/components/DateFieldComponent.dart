import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFieldComponent extends StatelessWidget {
  TextEditingController controller;
  String hinttext;
  DateFieldComponent(this.controller,this.hinttext);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14)
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: "${hinttext}",
            hintStyle: TextStyle(fontSize: 17),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(20)
        ),
        onTap: () async {
          DateTime? pickeddate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2050));
           controller.text = DateFormat("dd-MM-yyyy").format(pickeddate!).toString();
        },

      ),
    );
  }
}
