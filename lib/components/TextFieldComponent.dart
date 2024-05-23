import 'package:flutter/material.dart';
class TextFieldComponent extends StatelessWidget {
  TextEditingController controller;
  String hinttext;
  TextFieldComponent(this.controller,this.hinttext);

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
      ),
    );
  }
}
