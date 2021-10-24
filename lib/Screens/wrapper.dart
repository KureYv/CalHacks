// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Authenticate/authentication.dart';
import 'Home/home.dart';
import 'package:hackathon/Models/user.dart';
import 'package:provider/provider.dart';
import 'package:hackathon/Services/auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final user = Provider.of<Users?>(context);
    _auth.signOut();
      if (user == null){
        return Authenticate();
      }
      else {
        return Home();
      }

    }
  }

