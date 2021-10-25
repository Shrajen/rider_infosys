import 'package:flutter/material.dart';
import 'package:riderdbms/models/user.dart';
import 'package:riderdbms/services/database.dart';
import 'package:riderdbms/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:riderdbms/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
//  final List<String>  bloodgroups = ['A+','A-','AB+','AB-','O+','O-','B+','B+'];

  //form values
  String _currentridername;
  String _currentaddress;
  String _currentbloodgroup;
  String _currentmobile;
  String _currentbike;
  String _currentrelativeno;
  String _currentbikename;
  String _currentsearchKey;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your Rider Information',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData.ridername,
                      decoration:
                          textInputDecoration.copyWith(labelText: 'Rider Name'),
                      validator: (val) =>
                          val.isEmpty ? 'Please enter a name' : null,
                      onChanged: (val) =>
                          setState(() => _currentridername = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      initialValue: userData.bike,
                      decoration: textInputDecoration.copyWith(
                          labelText: 'Bike Model', hintText: 'Yamaha R15'),
                      validator: (val) =>
                          val.isEmpty ? 'Please enter a bike model' : null,
                      onChanged: (val) => setState(() => _currentbike = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      initialValue: userData.bikename,
                      decoration: textInputDecoration.copyWith(
                          labelText: 'State.no-V.type-V.Code-V.no',
                          hintText: '2-B-DE-1234'),
                      validator: (val) =>
                          val.isEmpty ? 'Please enter Bike Number' : null,
                      onChanged: (val) =>
                          setState(() => _currentbikename = val),
//                          onSaved: (String value) {
//                            _currentsearchKey = '_currentbikename[0]';
//                          },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      initialValue: userData.address,
                      decoration:
                          textInputDecoration.copyWith(labelText: 'Address'),
                      validator: (val) =>
                          val.isEmpty ? 'Please enter your address' : null,
                      onChanged: (val) => setState(() => _currentaddress = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      initialValue: userData.bloodgroup,
                      decoration: textInputDecoration.copyWith(
                          labelText: 'Blood Group', hintText: 'O+ve'),
                      validator: (val) =>
                          val.isEmpty ? 'Please enter your bloodGroup' : null,
                      onChanged: (val) =>
                          setState(() => _currentbloodgroup = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      initialValue: userData.mobile,
                      decoration: textInputDecoration.copyWith(
                          labelText: 'Contact No.'),
                      validator: (val) =>
                          val.isEmpty ? 'Please enter a your number' : null,
                      onChanged: (val) => setState(() => _currentmobile = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      initialValue: userData.relativeno,
                      decoration: textInputDecoration.copyWith(
                          labelText: 'Relative no.'),
                      validator: (val) =>
                          val.isEmpty ? 'Please enter relative no.' : null,
                      onChanged: (val) =>
                          setState(() => _currentrelativeno = val),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
//                        TextFormField(
//                          initialValue: userData.searchKey,
//                          decoration: textInputDecoration.copyWith(labelText: 'Address'),
//                          validator: (val) => val.isEmpty ? 'Please enter your address' : null,
//                          onChanged: (val) => setState(() => _currentsearchKey = _currentbike[0]),
//                        ),
//                        SizedBox(height: 20.0,),
//          DropdownButtonFormField(
//            items: bloodgroups.map((bloodgroup){
//              return DropdownMenuItem(
//                value: bloodgroup,
//              child: Text('$bloodgroup bloodgroups'),
//              ).toStringShort()
//            }),
//          ),

                    ElevatedButton(
                      // color: Colors.red,
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                            _currentridername ?? userData.ridername,
                            _currentaddress ?? userData.address,
                            _currentbloodgroup ?? userData.bloodgroup,
                            _currentmobile ?? userData.mobile,
                            _currentbike ?? userData.bike,
                            _currentrelativeno ?? userData.relativeno,
                            _currentbikename ?? userData.bikename,
                            _currentsearchKey ?? _currentbikename[0],
                          );
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
