// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon/Models/user.dart';
import 'package:hackathon/Services/database.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users _userFromFirebaseUser(User? user){
    return Users(uid:user!.uid);
  }

  Stream<Users> get user{
      return _auth.authStateChanges()
          .map(_userFromFirebaseUser);
  }

  Future signIn (String email, String password) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    return _userFromFirebaseUser(user);

  }


  Future register(String email, String password) async{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await DBService(uid:user!.uid).updateData('High','bruh');
      return _userFromFirebaseUser(user);
  }

  Future signOut() async{
    return await _auth.signOut();
  }
}