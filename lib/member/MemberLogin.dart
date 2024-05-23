import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/ButtonComponent.dart';
import 'package:gymappbysumit/components/PasswordFieldComponent.dart';
import 'package:gymappbysumit/components/TextFieldComponent.dart';
import 'package:gymappbysumit/member/MemberHome.dart';
import 'package:gymappbysumit/member/MemberRegister.dart';
import 'package:gymappbysumit/services/authservice.dart';
import 'package:gymappbysumit/utils/messages.dart';
class MemberLogin extends StatefulWidget {
  const MemberLogin({Key? key}) : super(key: key);

  @override
  State<MemberLogin> createState() => _MemberLoginState();
}

class _MemberLoginState extends State<MemberLogin> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();

  Future login() async {
    User? user = await AuthService().login(emailcontroller.text, pwdcontroller.text);
    if(user != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MemberHome()));
    }else{
      error(context, "Please Enter Valid Email Or Password", Colors.redAccent);
    }
  }
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
                  TextFieldComponent(emailcontroller, "Email:"),
                  PasswordFieldComponent(pwdcontroller, "Password:"),
                  ButtonComponent(login, "Login"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberRegister()));
                  }, child: Text("Not have an account? Register",style: TextStyle(color: Color(0xff675C84),fontSize: 20),))
                ],
              ),
            ),
          ),
        )
    );
  }
}
