import 'package:flutter/material.dart';

import '../components/AppBarComponent.dart';
import '../components/ButtonComponent.dart';
import '../components/DateFieldComponent.dart';
import '../components/DrawerComponent.dart';
import '../components/TextFieldComponent.dart';
import '../models/equipmentmodel.dart';
import '../services/equipmentservice.dart';
import '../utils/messages.dart';

class AdminEditEquipment extends StatefulWidget {
  EquipmentModel Equipment = EquipmentModel();
  AdminEditEquipment(this.Equipment);

  @override
  State<AdminEditEquipment> createState() => _AdminEditEquipmentState();
}

class _AdminEditEquipmentState extends State<AdminEditEquipment> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController companycontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController quantitycontroller = TextEditingController();

  Future updateequipmet() async {
    if (namecontroller.text == "" ||
        companycontroller.text == "" ||
        pricecontroller.text == "" ||
        quantitycontroller.text == "" ||
        datecontroller.text == "") {
      error(context, "All Fields Are Required ", Colors.red);
      return;
    }
    await EquipmentService().UpdateEquipment(
        widget.Equipment.id!,
        namecontroller.text,
        int.parse(pricecontroller.text),
        companycontroller.text,
        int.parse(quantitycontroller.text),
        datecontroller.text);
        success(context, "Equipmet Updated Successfully", Colors.green);

        namecontroller.text = "";
        companycontroller.text = "";
        pricecontroller.text = "";
        quantitycontroller.text = "";
        datecontroller.text = "";
  }

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.Equipment.name!;
    pricecontroller.text = widget.Equipment.price.toString();
    companycontroller.text = widget.Equipment.company.toString();
    datecontroller.text = widget.Equipment.date.toString();
    quantitycontroller.text = widget.Equipment.quantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBarComponent("Update Equipment"),
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
                TextFieldComponent(namecontroller, "Equipment"),
                TextFieldComponent(pricecontroller, "Price"),
                TextFieldComponent(quantitycontroller, "uantity"),
                DateFieldComponent(datecontroller, "Purchase Date"),
                ButtonComponent(updateequipmet, "Update Equipment")
              ],
            ),
          ),
        ));
  }
}
