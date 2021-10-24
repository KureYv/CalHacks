// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:hackathon/Services/Auth.dart';
import 'package:hackathon/Screens/Authenticate/register.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 144, 182, 1),
      appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign up here'),
            onPressed:(){
              widget.toggleView();
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
      body: ListView(
        padding: const EdgeInsets.only(top:100.0,left: 50.0,right:50.0),
        children: <Widget>[
          Center(
            child:Container(
              width: 380,
              height: 349,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height:15.0),
                  TextFormField(

                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),

                        ),
                      ),
                      fillColor: Colors.black12,
                      filled: true,
                      prefixIcon: Icon(Icons.email),
                      labelText:'Email or @sign',
                    ),
                  ),

                  const SizedBox(height:40.0),
                  TextFormField(
                    onChanged: (val){
                     setState(() {
                       password = val;
                     });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),

                        ),
                      ),
                      fillColor: Colors.black12,
                      filled: true,
                      labelText:'Password',

                      prefixIcon: Icon(Icons.password),
                    ),
                  ),


                  const SizedBox(height:40.0),

                  FlatButton(
                      color: Color.fromRGBO(20, 84, 159, 1),

                      onPressed:() async {
                        dynamic result = await _auth.signIn(email,password);
                        if(result != null){
                          print('Login Successful');
                        }

                      },
                      child: const Center(
                        child:Text(

                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )


                  ),
                ],
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                border:Border.all(
                  color: Colors.white,

                ),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

