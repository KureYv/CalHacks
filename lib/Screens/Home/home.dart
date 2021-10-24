// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Services/auth.dart';
import 'package:hackathon/Services/database.dart';
import 'package:hackathon/Models/pass.dart';
import 'package:provider/provider.dart';
import 'package:hackathon/Screens/Home/passwordlist.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider <List<Pass>>.value(
      value: DBService(uid: '').passwords,
      initialData: [],
      child:Scaffold(
        backgroundColor: const Color.fromRGBO(111, 144, 182, 1),
        appBar: AppBar(
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.add),
                label: Text(''),
                onPressed:() async {

                },
              ),
            ],
            shape: const RoundedRectangleBorder(
              borderRadius:BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            elevation: 0,
            title: const Text(
              "SAFE",
              style: TextStyle(
              fontSize: 36.0,
             color: Color.fromRGBO(20, 84, 159, 1),
              fontFamily: 'Viga',

              ),
            ),
            backgroundColor: const Color.fromRGBO(163, 181, 206, 1),
            centerTitle: true,

        ),
      ),

      );
  }


}
