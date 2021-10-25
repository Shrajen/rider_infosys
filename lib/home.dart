import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riderdbms/screens/wrapper.dart';
import 'package:riderdbms/services/auth.dart';
import 'package:riderdbms/models/user.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
