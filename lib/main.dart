import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gymappbysumit/admin/AdminAddPackage.dart';
import 'package:gymappbysumit/admin/AdminAddTrainer.dart';
import 'package:gymappbysumit/admin/AdminDashboard.dart';
import 'package:gymappbysumit/admin/AdminLogin.dart';
import 'package:gymappbysumit/admin/AdminViewApprovedRequests.dart';
import 'package:gymappbysumit/admin/AdminViewEquipment.dart';
import 'package:gymappbysumit/admin/AdminViewPackages.dart';
import 'package:gymappbysumit/admin/AdminViewRejectedRequests.dart';
import 'package:gymappbysumit/admin/AdminViewPendingRequests.dart';
import 'package:gymappbysumit/admin/AdminViewTrainer.dart';
import 'package:gymappbysumit/member/MemberLogin.dart';
import 'package:gymappbysumit/member/MemberRegister.dart';
import 'package:gymappbysumit/member/MemberHome.dart';
import 'package:gymappbysumit/services/membershiprequests.dart';

import 'MainScreen.dart';
import 'admin/AdminAddEquipment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        backgroundColor: Color(0xfff2f2f2),
        splash: "images/gym.png",
        splashIconSize: 200,
        nextScreen: MainScreen(),
        duration: 1,
        splashTransition: SplashTransition.fadeTransition,
      ),
    ),
  );
}
