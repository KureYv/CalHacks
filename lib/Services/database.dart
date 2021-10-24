import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon/Models/pass.dart';

class DBService{
  final String uid;
  DBService({ required this.uid });
  final CollectionReference collection = FirebaseFirestore.instance.collection('Values');

  Future updateData(String user, String password) async{
    return await collection.doc(uid).set  ({
      'user':user,
      'password':password,
    });
  }

  List <Pass> _passListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Pass(
          user: doc.get('user')??'',
          pass : doc.get('pass')??'0',
      );
    }).toList();
  }

  Stream<List<Pass>> get passwords{
    return collection.snapshots()
      .map(_passListFromSnapshot);
  }
}