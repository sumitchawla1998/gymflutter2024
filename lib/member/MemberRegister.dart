import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/ButtonComponent.dart';
import 'package:gymappbysumit/components/PasswordFieldComponent.dart';
import 'package:gymappbysumit/components/TextFieldComponent.dart';
import 'package:gymappbysumit/member/MemberLogin.dart';
import 'package:gymappbysumit/services/authservice.dart';
import 'package:gymappbysumit/utils/messages.dart';
class MemberRegister extends StatefulWidget {
  const MemberRegister({Key? key}) : super(key: key);

  @override
  State<MemberRegister> createState() => _MemberRegisterState();
}

class _MemberRegisterState extends State<MemberRegister> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();

  Future register() async {
    User? user = await AuthService().register(namecontroller.text,emailcontroller.text, pwdcontroller.text);
    if(user != null){
      success(context, "Member Registered", Colors.green);

      Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberLogin()));
    }
    else
    {
      error(context, "Member Registration Failed", Colors.red);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        // appBar: AppBar(
        //   title: Text("Member Register"),
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
                  TextFieldComponent(namecontroller, "Name:"),
                  TextFieldComponent(emailcontroller, "Email:"),
                  PasswordFieldComponent(pwdcontroller, "Password:"),
                  ButtonComponent(register, "Register"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberLogin()));
                  }, child: Text("Already have an account? Login",style: TextStyle(color: Color(0xff675C84),fontSize: 20),))
                ],
              ),
            ),
          ),
        )
    );
  }
}
