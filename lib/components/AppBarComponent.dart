import 'package:flutter/material.dart';
class AppBarComponent extends StatelessWidget implements PreferredSizeWidget{
  String? title;
  AppBarComponent(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
      ),
      toolbarHeight: 100,
      title: Text("$title",style: TextStyle(color: Color(0xffFF7757),fontSize: 30),),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.chevron_left,color: Color(0xffFF7757),size: 50,)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
