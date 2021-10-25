import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riderdbms/models/rider.dart';
import 'package:riderdbms/models/user.dart';
class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });
  //collection reference
  final CollectionReference riderCollection = Firestore.instance.collection('riders');

  Future updateUserData(String ridername, String address, String bloodgroup, String mobile, String bike,String relativeno, String bikename, String searchKey ) async{
    return await riderCollection.document(uid).setData({
      'ridername' : ridername,
      'address' : address,
      'bloodgroup' : bloodgroup,
      'mobile' : mobile,
      'bike' : bike,
    'relativeno' : relativeno,
    'bikename' : bikename,
      'searchKey' : searchKey
    });
  }
  //rider list from snapshot
  List<Rider> _riderListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Rider(
          ridername: doc.data['ridername'] ?? '',
          address: doc.data['address'] ?? '0',
          bloodgroup: doc.data['bloodgroup'] ?? '0',
      mobile: doc.data['mobile'] ?? '0',
      bike: doc.data['bike'] ?? '0',
      relativeno: doc.data['relativeno'] ?? '0',
      bikename: doc.data['bikename'] ?? '0',
        searchKey: doc.data['searchKey'] ?? '0',
      );
    }).toList();
  }
//user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      ridername : snapshot.data['ridername'],
      address : snapshot.data['address'],
      bloodgroup : snapshot.data['bloodgroup'],
      mobile : snapshot.data['mobile'],
      bike : snapshot.data['bike'],
      relativeno : snapshot.data['relativeno'],
      bikename : snapshot.data['bikename'],
      searchKey : snapshot.data['searchKey'],
    );
  }


  //get rider stream
Stream<List<Rider>> get riders {
    return riderCollection.snapshots()
    .map(_riderListFromSnapshot);
}

//get user doc stream
Stream<UserData> get userData {
    return riderCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
}
}