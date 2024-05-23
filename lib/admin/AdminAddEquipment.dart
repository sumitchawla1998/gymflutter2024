import 'package:flutter/material.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/ButtonComponent.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';
import 'package:gymappbysumit/components/TextFieldComponent.dart';
import 'package:gymappbysumit/services/equipmentservice.dart';
import 'package:gymappbysumit/utils/messages.dart';
import 'package:intl/intl.dart';

import '../components/DateFieldComponent.dart';

class AdminAddEquipment extends StatefulWidget {
  const AdminAddEquipment({Key? key}) : super(key: key);

  @override
  State<AdminAddEquipment> createState() => _AdminAddEquipmentState();
}

class _AdminAddEquipmentState extends State<AdminAddEquipment> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController companycontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController quantitycontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  Future addequipment() async {
    if (namecontroller.text == "" ||
        companycontroller.text == "" ||
        pricecontroller.text == "" ||
        quantitycontroller.text == "" ||
        datecontroller.text == "") {
      error(context, "All Fields Are Required ", Colors.red);
      return;
    }
    await EquipmentService().addequipment(
        namecontroller.text,
        companycontroller.text,
        int.parse(pricecontroller.text),
        int.parse(quantitycontroller.text),
        datecontroller.text);
    success(context, "Equipment Added", Colors.green);

    namecontroller.text = "";
    companycontroller.text = "";
    pricecontroller.text = "";
    quantitycontroller.text = "";
    datecontroller.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBarComponent("Add Equipment"),
      drawer: DrawerComponent(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldComponent(namecontroller, "Equipment"),
              TextFieldComponent(companycontroller, "Company"),
              TextFieldComponent(pricecontroller, "Price"),
              TextFieldComponent(quantitycontroller, "Quantity"),
              DateFieldComponent(datecontroller, "Purchase Date"),
              ButtonComponent(addequipment, "Add Equipment")
            ],
          ),
        ),
      ),
    );
  }
}
