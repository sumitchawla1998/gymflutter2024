import 'package:flutter/material.dart';
import 'package:gymappbysumit/admin/AdminAddTrainer.dart';
import 'package:gymappbysumit/admin/AdminDashboard.dart';
import 'package:gymappbysumit/components/ButtonComponent.dart';
import 'package:gymappbysumit/components/PasswordFieldComponent.dart';
import 'package:gymappbysumit/components/TextFieldComponent.dart';
import 'package:gymappbysumit/services/adminservice.dart';
import 'package:gymappbysumit/utils/messages.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController unmcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();

  Future login() async {
      int l = await AdminService().login(unmcontroller.text, pwdcontroller.text);
      if(l == 1){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminDashboard()));
      }else{
        error(context, "Please Enter Valid Credentials", Colors.red);
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      // appBar: AppBar(
      //   title: Text("Admin Login"),
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
                TextFieldComponent(unmcontroller, "Username:"),
                PasswordFieldComponent(pwdcontroller, "Password:"),
                ButtonComponent(login,"Login"),
              ],
            ),
          ),
        ),
      )
    );
  }
}
