import 'package:cloud_firestore/cloud_firestore.dart';

class TrackStatusService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future getPackageStatus(uid) async {
    QuerySnapshot snapshot = await firestore
        .collection("membershiprequests")
        .where("uid", isEqualTo: uid)
        .get();

    return snapshot.docs.first;
  }
}
