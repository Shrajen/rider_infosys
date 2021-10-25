import 'package:cloud_firestore/cloud_firestore.dart';


class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('riders')
        .where('searchKey', isEqualTo: searchField,)
        .getDocuments();


  }
}