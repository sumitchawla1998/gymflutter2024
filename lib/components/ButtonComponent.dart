import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent(this.callback,this.btntext);

  VoidCallback callback;
  String btntext;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ElevatedButton(child: Text("${btntext}",style: TextStyle(fontSize: 17),),onPressed: callback,style: ElevatedButton.styleFrom(backgroundColor: Color(0xffFF7757),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),),
    );
  }
}
