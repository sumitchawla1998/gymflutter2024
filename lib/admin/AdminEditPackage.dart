import 'package:flutter/material.dart';
import 'package:gymappbysumit/models/packagemodel.dart';

import '../components/AppBarComponent.dart';
import '../components/ButtonComponent.dart';
import '../components/DrawerComponent.dart';
import '../components/TextFieldComponent.dart';
import '../services/packageservice.dart';
import '../utils/messages.dart';

class AdminEditPackage extends StatefulWidget {
  PackageModel package = PackageModel();
  AdminEditPackage(this.package);

  @override
  State<AdminEditPackage> createState() => _AdminEditPackageState();
}

class _AdminEditPackageState extends State<AdminEditPackage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController durationcontroller = TextEditingController();

  Future update() async {
    if (namecontroller.text == "" ||
        pricecontroller.text == "" ||
        durationcontroller.text == "") {
      error(context, 'All Field Are required', Colors.red);
      return;
    }

    await PackageService().updatepackage(
        widget.package.id!,
        namecontroller.text,
        int.parse(pricecontroller.text),
        durationcontroller.text);
    success(context, "Package Updated", Colors.green);

    namecontroller.text = "";
    pricecontroller.text = "";
    durationcontroller.text = "";
  }

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.package.name!;
    pricecontroller.text = widget.package.price.toString();
    durationcontroller.text = widget.package.duration.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        drawer: DrawerComponent(),
        appBar: AppBarComponent("Edit Package"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFieldComponent(namecontroller, "Name:"),
                  TextFieldComponent(pricecontroller, "Package Price:"),
                  TextFieldComponent(durationcontroller, "Package Duration:"),
                  ButtonComponent(update, "Update Package"),
                ])));
  }
}
