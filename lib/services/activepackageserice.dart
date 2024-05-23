import 'package:cloud_firestore/cloud_firestore.dart';

class ActivePackageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future getActivePackage(uid) async {
    QuerySnapshot snapshot = await firestore
        .collection("membershiprequests")
        .where("status", isEqualTo: "Approved")
        .where("uid", isEqualTo: uid)
        .get();

    return snapshot.docs.first;
  }
}
