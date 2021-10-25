import 'package:flutter/material.dart';
import 'package:riderdbms/models/rider.dart';
import 'package:provider/provider.dart';
import 'package:riderdbms/screens/home/rider_tile.dart';


class RiderList extends StatefulWidget{

  @override
  _RiderListState createState() => _RiderListState();
}

class _RiderListState extends State<RiderList> {

  @override
  Widget build(BuildContext context) {

    final riders = Provider.of<List<Rider>>(context) ?? [];


    return ListView.builder(
      itemCount: riders.length,
      itemBuilder: (context, index){
        return RiderTile(rider: riders[index]);
      },

    );

  }
}

//    riders.forEach((rider) {
//      print(rider.ridername);
//      print(rider.address);
//      print(rider.bloodgroup);
//      print(rider.mobile);
//      print(rider.bike);
//      print(rider.relativeno);
//      print(rider.bikename);

//    });