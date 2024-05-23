import 'package:flutter/material.dart';
void success(BuildContext context,String msg,Color color){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${msg}",style: TextStyle(fontSize: 17),),backgroundColor:color));
}

void error(BuildContext context,String msg,Color color){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${msg}",style: TextStyle(fontSize: 17),),backgroundColor:color));
}





