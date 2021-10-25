import 'package:flutter/material.dart';
import 'package:riderdbms/screens/home/settings_form.dart';
import 'package:riderdbms/services/auth.dart';
import 'package:riderdbms/services/database.dart';
import 'package:provider/provider.dart';
import 'package:riderdbms/screens/home/rider_list.dart';
import 'package:riderdbms/models/rider.dart';
//import 'package:riderdbms/screens/home/bms.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Rider>>.value(
      value: DatabaseService().riders,
      child: Scaffold(
        backgroundColor: Colors.grey[60],
        appBar: AppBar(
          title: Text('Profiles'),
          backgroundColor: Colors.red,
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text("Logout"),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            TextButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.update),
                label: Text('Update'))
          ],
        ),
        body: Container(color: Colors.grey, child: RiderList()),
      ),
    );
  }
}
