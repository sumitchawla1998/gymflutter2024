import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gymappbysumit/admin/AdminLogin.dart';

class MenuItemComponent extends StatelessWidget {
  IconData icondata;
  String text;
  var screen;

  MenuItemComponent(this.icondata,this.text,this.screen);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icondata),
      title: Text("${text}"),
      onTap: () async {
        if(text == "Logout"){
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => screen));
          return;
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => screen));
      },
    );
  }
}
