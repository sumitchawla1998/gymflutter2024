import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gymappbysumit/MainScreen.dart';
import 'package:gymappbysumit/admin/AdminAddEquipment.dart';
import 'package:gymappbysumit/admin/AdminAddPackage.dart';
import 'package:gymappbysumit/admin/AdminAddTrainer.dart';
import 'package:gymappbysumit/admin/AdminDashboard.dart';
import 'package:gymappbysumit/admin/AdminViewApprovedRequests.dart';
import 'package:gymappbysumit/admin/AdminViewEquipment.dart';
import 'package:gymappbysumit/admin/AdminViewPackages.dart';
import 'package:gymappbysumit/admin/AdminViewPendingRequests.dart';
import 'package:gymappbysumit/admin/AdminViewRejectedRequests.dart';
import 'package:gymappbysumit/admin/AdminViewTrainer.dart';
import 'package:gymappbysumit/member/MemberActivePackage.dart';
import 'package:gymappbysumit/member/MemberHome.dart';
import 'package:gymappbysumit/member/MemberLogin.dart';
import 'package:gymappbysumit/member/MemberTrackStatus.dart';

import '../admin/AdminLogin.dart';
import 'MenuItemComponent.dart';
class DrawerComponent extends StatelessWidget {
  DrawerComponent({Key? key}) : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return user != null  ? MemberDrawer() : AdminDrawer();
  }
}

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffFF7757),
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xffFF7757),),
              accountName: Text(
                "Welcome, Admin",
                style: TextStyle(fontSize: 16),
              ),
              accountEmail: Text(""),
              currentAccountPictureSize: Size.square(42),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person,size: 30,color: Color(0xff675c84),),
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ),
          // uid == null  ? Text("Admin"): Text("User"),
          MenuItemComponent(Icons.dashboard,"Dashboard",AdminDashboard()),
          MenuItemComponent(Icons.add_card,"Add Package",AdminAddPackage()),
          MenuItemComponent(Icons.today,"View Packages",AdminViewPackages()),
          MenuItemComponent(Icons.person_add,"Add Trainer",AdminAddTrainer()),
          MenuItemComponent(Icons.group,"View Trainers",AdminViewTrainer()),
          MenuItemComponent(Icons.add_box_rounded,"Add Equipment",AdminAddEquipment()),
          MenuItemComponent(Icons.fitness_center,"View Equipments",AdminViewEquipments()),
          MenuItemComponent(Icons.pending,"Pending Requests",AdminViewPendingRequests()),
          MenuItemComponent(Icons.thumb_up,"Approved Requests",AdminViewApprovedRequests()),
          MenuItemComponent(Icons.thumb_down,"Rejected Requests",AdminViewRejectedRequests()),
          MenuItemComponent(Icons.logout,"Logout",MainScreen()),

        ],
      ),
    );
  }
}

class MemberDrawer extends StatelessWidget {
  MemberDrawer({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffFF7757),
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xffFF7757),),
              accountName: Text(
                "Welcome, ${auth.currentUser!.displayName}",
                style: TextStyle(fontSize: 16),
              ),
              accountEmail: Text(""),
              currentAccountPictureSize: Size.square(42),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person,size: 30,color: Color(0xff675c84),),
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ),

          MenuItemComponent(Icons.today,"All Packages",MemberHome()),

          MenuItemComponent(Icons.check_circle,"Active Package",MemberActivePackage()),

          MenuItemComponent(Icons.spatial_tracking,"Track Status",MemberTrackStatus()),

          MenuItemComponent(Icons.logout,"Logout",MainScreen())


        ],
      ),
    );
  }
}


