import 'package:flutter/material.dart';
import 'package:gymappbysumit/member/MemberLogin.dart';

import 'admin/AdminLogin.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Color(0xfff2f2f2),
        // appBar: AppBar(
        //   title: Text("Member Login"),
        // ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 160.0,
                    height: 160.0,
                    child: Image(
                      image: AssetImage("images/gym.png"),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Make Yourself",textAlign: TextAlign.center,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Color(0xffFF7757)),),
                  Text("Better",textAlign: TextAlign.center,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Color(0xff675C84)),),
                  SizedBox(
                    height: 24,
                  ),

                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLogin()));
                    },style: ElevatedButton.styleFrom(backgroundColor: Color(0xffFF7757),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), child: Text("Admin Login",style: TextStyle(fontSize: 17),)),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberLogin()));
                    },style: ElevatedButton.styleFrom(backgroundColor: Color(0xffFF7757),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), child: Text("Member Login",style: TextStyle(fontSize: 17),)),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
