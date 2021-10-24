import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:hackathon/Models/pass.dart';


class Passwords extends StatefulWidget {
  const Passwords({Key? key}) : super(key: key);

  @override
  _PasswordsState createState() => _PasswordsState();
}

class _PasswordsState extends State<Passwords> {
  @override
  Widget build(BuildContext context) {
    final passwords = Provider.of<List<Pass>>(context);
    passwords.forEach((pass){
      print(pass.user);
      print(pass.pass);
      });

    return Container(

    );
  }
}
