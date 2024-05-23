import 'package:flutter/material.dart';

import '../components/AppBarComponent.dart';
import '../components/ButtonComponent.dart';
import '../components/DateFieldComponent.dart';
import '../components/DrawerComponent.dart';
import '../components/TextFieldComponent.dart';
import '../models/trainermodel.dart';
import '../services/trainerservice.dart';
import '../utils/messages.dart';

class AdminEditTrainer extends StatefulWidget {
  TrainerModel trainer = TrainerModel();
  AdminEditTrainer(this.trainer);

  @override
  State<AdminEditTrainer> createState() => _AdminEditTrainerState();
}

class _AdminEditTrainerState extends State<AdminEditTrainer> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController salcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();

  Future updatetrainer() async {
    if (namecontroller.text == "" ||
        emailcontroller.text == "" ||
        mobilecontroller.text == "" ||
        salcontroller.text == "" ||
        addcontroller.text == "" ||
        datecontroller.text == "") {
      error(context, "All Fields Are Required", Colors.red);
      return;
    }
    await TrainerService().Updatetrainer(
      widget.trainer.id!,
      namecontroller.text,
      emailcontroller.text,
      datecontroller.text,
      int.parse(salcontroller.text),
      addcontroller.text,
      mobilecontroller.text,
    );
    success(context, "Trainer Updated Successfully", Colors.green);
    namecontroller.text = "";
    emailcontroller.text = "";
    mobilecontroller.text = "";
    salcontroller.text = "";
    addcontroller.text = "";
    datecontroller.text = "";
  }

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.trainer.name!;
    emailcontroller.text = widget.trainer.email.toString();
    addcontroller.text = widget.trainer.address.toString();
    datecontroller.text = widget.trainer.joindate.toString();
    salcontroller.text = widget.trainer.salary.toString();
    mobilecontroller.text = widget.trainer.mobile.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBarComponent("Update Trainer"),
      drawer: DrawerComponent(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldComponent(namecontroller, "Trainer Name"),
              TextFieldComponent(emailcontroller, "Trainer Email"),
              TextFieldComponent(mobilecontroller, "Mobile No"),
              TextFieldComponent(salcontroller, "Salary"),
              TextFieldComponent(addcontroller, "Address"),
              DateFieldComponent(datecontroller, "Join Date"),
              ButtonComponent(updatetrainer, "Update Trainer")
            ],
          ),
        ),
      ),
    );
    ;
  }
}
