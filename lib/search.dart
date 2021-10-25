import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riderdbms/searchservice.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }


    if (value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['bikename'].startsWith(value)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      backgroundColor: Colors.blueGrey,
        appBar: new AppBar(
          backgroundColor: Colors.red,
          title: Text('Rider Information Search'),
        ),
        body: ListView(children: <Widget>[
            Padding(

              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (val) {
                  initiateSearch(val);
                },
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.arrow_back),
                      iconSize: 20.0,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    contentPadding: EdgeInsets.only(left: 25.0),
                    hintText: 'Search by BikeNumber',
                    labelText: '2-B-DE-1234',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0))),
              ),
            ),
            SizedBox(height: 10.0),
            GridView.count(

              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
                primary: false,
                shrinkWrap: true,
                children: tempSearchStore.map((riders) {
                  return buildResultCard(riders);
                }).toList())
          ]),
        );
  }
}

Widget buildResultCard(data) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),

//      child: ListTile(
//          title: Text('bikeno:\n' + data['bikename'])
//      )
      elevation: 2.0,
      child: Container(
        color: Colors.blueGrey,
              child: Center(
                child: Text('Bike No.:'+ data['bikename']+'\n'
                    'RiderName:'+ data['ridername']+'\n'
                    'Contact no.:'+ data['mobile']+'\n'
                    'Relativeno'+ data['relativeno']+'\n'
                    'Address'+ data['address']+'\n'
                    'Blood Group'+ data['bloodgroup']+'\n'
                    'Bike Model'+ data['bike']+'\n',

                  textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 12.0,),
                ),
              )

          ),
  );
}
//child: ListTile(
//title: Text(rider.ridername),
//subtitle: Text('Bike No.: ${rider.bikename}\nBike Name:${rider.bike} \nMobile:${rider.mobile} \nRelative No:${rider.relativeno} \nBlood Group:${rider.bloodgroup} \nBike Name:${rider.bikename}'),
////        trailing: Icon(Icons.motorcycle),
//contentPadding: EdgeInsets.fromLTRB(0.0, 30.0, 0, 30.0),
//
//),