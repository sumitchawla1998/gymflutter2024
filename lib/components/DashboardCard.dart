import 'package:flutter/material.dart';
class DashboardCard extends StatelessWidget {
  Color color;
  IconData icondata;
  String text;
  int value;

  DashboardCard(this.icondata,this.text,this.value,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14)
        ),
        color:  color,
        margin: EdgeInsets.symmetric(vertical: 12,horizontal: 0),
        elevation: 0.8,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.network("",width: 120,),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icondata,color: Colors.white,),
                    SizedBox(height: 10,),
                    Text(
                      "${text}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "${value}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.white
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
