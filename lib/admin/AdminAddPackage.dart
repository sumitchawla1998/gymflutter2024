import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/ButtonComponent.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';
import 'package:gymappbysumit/components/TextFieldComponent.dart';
import 'package:gymappbysumit/services/packageservice.dart';
import 'package:gymappbysumit/utils/messages.dart';

class AdminAddPackage extends StatefulWidget {
  const AdminAddPackage({Key? key}) : super(key: key);

  @override
  State<AdminAddPackage> createState() => _AdminAddPackageState();
}

class _AdminAddPackageState extends State<AdminAddPackage> {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController durationcontroller = TextEditingController();

  Future addpackage()async{
    if(namecontroller.text == "" || pricecontroller.text == "" ||durationcontroller.text == ""){
      error(context,"All Fields Are Required", Colors.red);
      return;
    }
    await PackageService().addpackage(namecontroller.text, int.parse(pricecontroller.text), durationcontroller.text);
     success(context, "Package Added",Colors.green);

     namecontroller.text = "";
     pricecontroller.text = "";
     durationcontroller.text = "";
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBarComponent("Add Package"),
        drawer: DrawerComponent(),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldComponent(namecontroller, "Package Name:"),
              TextFieldComponent(pricecontroller, "Package Price:"),
              TextFieldComponent(durationcontroller, "Package Duration:"),
              ButtonComponent(addpackage, "Add Package")
            ],
          ),
        )
    );
  }
}
