// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Services/auth.dart';
import 'Screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:hackathon/Models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SAFE());
}

class SAFE extends StatelessWidget {
  const SAFE({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home:Wrapper(),
      )

    );
  }
}