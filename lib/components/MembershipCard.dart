import 'package:flutter/material.dart';
import 'package:gymappbysumit/utils/messages.dart';

import '../models/membershipmodel.dart';
import '../services/membershiprequests.dart';

class MembershipCard extends StatelessWidget {
  MembershipRequestsModel membershiprequests;
  MembershipCard(this.membershiprequests);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Color(0xffFF7757),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16, left: 10, right: 10),
            width: 160,
            child: Image(image: AssetImage("images/plan.png")),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Name : ${membershiprequests.displayname}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Email : ${membershiprequests.email}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Package : ${membershiprequests.name}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Duration : ${membershiprequests.duration}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Price : ${membershiprequests.price}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Status: ${membershiprequests.status}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              membershiprequests.status == "Approved"
                  ? ElevatedButton(
                      onPressed: () {
                        MembershipRequests().rejectjoiningrequests(
                            membershiprequests!.id);
                        success(context, "Request Rejected",
                            Colors.green);
                      },
                      child: Text(
                        "Reject",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xffFF7757)),
                    )
                  : membershiprequests.status == "Rejected"
                      ? ElevatedButton(
                          onPressed: () {
                            MembershipRequests().approvedjoiningrequests(
                                membershiprequests!.id);
                            success(context, "Request Approved", Colors.green);
                          },
                          child: Text(
                            "Approve",
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Color(0xffFF7757)),
                        )
                      : Row(
                          children: [
                            if (membershiprequests.status == "Pending")
                              ElevatedButton(
                                onPressed: () {
                                  MembershipRequests().approvedjoiningrequests(
                                      membershiprequests!.id);
                                  success(context, "Request Approved",
                                      Colors.green);
                                },
                                child: Text(
                                  "Approve",
                                  style: TextStyle(fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Color(0xffFF7757)),
                              ),
                            SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                MembershipRequests().rejectjoiningrequests(
                                    membershiprequests!.id);
                                success(context, "Request Rejected",
                                    Colors.green);
                              },
                              child: Text(
                                "Reject",
                                style: TextStyle(fontSize: 16),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Color(0xffFF7757)),
                            ),
                          ],
                        )
            ],
          )
        ],
      ),
    );
  }
}
