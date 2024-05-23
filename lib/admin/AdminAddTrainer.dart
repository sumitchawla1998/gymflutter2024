import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/ButtonComponent.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';
import 'package:gymappbysumit/components/TextFieldComponent.dart';
import 'package:gymappbysumit/services/trainerservice.dart';
import 'package:gymappbysumit/utils/messages.dart';
import 'package:intl/intl.dart';

import '../components/DateFieldComponent.dart';
class AdminAddTrainer extends StatefulWidget {
  const AdminAddTrainer({Key? key}) : super(key: key);

  @override
  State<AdminAddTrainer> createState() => _AdminAddTrainerState();
}

class _AdminAddTrainerState extends State<AdminAddTrainer> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController salcontroller = TextEditingController();
  TextEditingController addcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();


  Future addtrainer() async {
    if(namecontroller.text == ""|| emailcontroller.text == ""|| mobilecontroller.text == ""|| salcontroller.text == ""||addcontroller.text==""||datecontroller.text == ""){
      error(context, "All Fields Are Required", Colors.red);
      return;
    }
     await TrainerService().addtrainer(namecontroller.text, emailcontroller.text, mobilecontroller.text, int.parse(salcontroller.text), addcontroller.text,datecontroller.text);

     success(context,"Trainer Added",Colors.green);

    namecontroller.text = "";
    emailcontroller.text = "";
    mobilecontroller.text = "";
    salcontroller.text = "";
    addcontroller.text="";
    datecontroller.text ="";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBarComponent("Add Trainer"),
      drawer: DrawerComponent(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldComponent(namecontroller, "Trainer:"),
              TextFieldComponent(emailcontroller, "Email:"),
              TextFieldComponent(mobilecontroller, "Mobile:"),
              TextFieldComponent(salcontroller, "Salary:"),
              TextFieldComponent(addcontroller, "Address:"),
              DateFieldComponent(datecontroller, "Date:"),
              ButtonComponent(addtrainer, "Add Trainer"),
            ],
          ),
        ),
      ),
    );
  }
}
