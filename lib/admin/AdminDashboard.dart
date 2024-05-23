import 'package:flutter/material.dart';
import 'package:gymappbysumit/admin/AdminLogin.dart';
import 'package:gymappbysumit/components/AppBarComponent.dart';
import 'package:gymappbysumit/components/DashboardCard.dart';
import 'package:gymappbysumit/components/DrawerComponent.dart';
import 'package:gymappbysumit/services/dashboardservice.dart';
class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  int tpackages = 0;
  int tmembers = 0;
  int ttrainers = 0;
  int tequipments = 0;
  int tpending = 0;
  int tapproved = 0;
  int trejected = 0;

  DashboardService dashboardService = DashboardService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showValues();

  }

  showValues()async {
    int packages = await dashboardService.getCount("packages");
    int members = await dashboardService.getCount("members");
    int trainers = await dashboardService.getCount("trainers");
    int equipments = await dashboardService.getCount("equipments");
    int pending = await dashboardService.getCount("membershiprequests","Pending");
    int approved = await dashboardService.getCount("membershiprequests","Approved");
    int rejected = await dashboardService.getCount("membershiprequests","Rejected");

    setState(() {
      tpackages = packages;
      tmembers = members;
      ttrainers = trainers;
      tequipments = equipments;
      tpending = pending;
      tapproved = approved;
      trejected = rejected;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBarComponent("Dashboard"),

      drawer: DrawerComponent(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DashboardCard(Icons.person, "Members", tmembers, Color(0xffFF7757)),
              DashboardCard(Icons.group, "Trainers", ttrainers, Color(0xff675c84)),
              DashboardCard(Icons.today, "Packages", tpackages, Color(0xffFF7757)),
              DashboardCard(Icons.group, "Equipments", tequipments, Color(0xff675c84)),
              DashboardCard(Icons.pending, "Pending", tpending, Color(0xffFF7757)),
              DashboardCard(Icons.thumb_up, "Approved", tpending, Color(0xff675c84)),
              DashboardCard(Icons.thumb_down, "Rejected", tpending, Color(0xffFF7757)),

            ],
          ),
        ),
      ),
    );
  }
}
