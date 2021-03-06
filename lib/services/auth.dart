import 'package:firebase_auth/firebase_auth.dart';
import 'package:riderdbms/models/user.dart';
import 'package:riderdbms/services/database.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }
  //auth change userstream
  Stream<User> get user {
    return _auth.onAuthStateChanged
//        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  .map(_userFromFirebaseUser);
  }
  //signin in anon
Future signInAnon() async{
  try{
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;

  }
}

  //signin with email and prassword
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


 //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //create a new document for the user with uid
      await DatabaseService(uid: user.uid).updateUserData('Name', 'City-District', 'O+ve', '9841******', 'Bike_Model', '9841******', 'Bike_no.','B');
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
}
}