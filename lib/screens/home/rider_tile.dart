import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riderdbms/models/rider.dart';

class RiderTile extends StatelessWidget {
  final Rider rider;
  RiderTile({this.rider});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.blueGrey,
        margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: ListTile(
          leading: Image(
            image: AssetImage("Images/444.jpg"),
//                          image: NetworkImage('https://scontent.fktm1-1.fna.fbcdn.net/v/t1.0-9/87024585_2755568624550658_961766730898604032_n.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=7L4hFKvnhWUAX99FVfx&_nc_ht=scontent.fktm1-1.fna&oh=76da636a43ef8e99a1f8ec5d70f7aeef&oe=5E9FBEF1'),
          ),
          title: Text(rider.ridername),
          subtitle: Text(
              'Bike No.: ${rider.bikename}\nBike Name:${rider.bike} \nMobile:${rider.mobile} \nRelative No:${rider.relativeno} \nBlood Group:${rider.bloodgroup} \nBike Name:${rider.bikename}'),
//        trailing: Icon(Icons.motorcycle),
          contentPadding: EdgeInsets.fromLTRB(0.0, 30.0, 0, 30.0),
        ),
      ),
    );
  }
}
