
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:testing/screen/screens.dart';



class LoginPage extends StatefulWidget {
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 String _email,_pass;
 final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              
              key:_formkey,
              child:Column(
                children: <Widget>[
                  TextFormField(
                    
                    onSaved:(input)=> _email= input ,
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      
                      
                    ),
                  ),
                  TextFormField(
                    onSaved:(input)=> _pass= input ,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD'
                    ),
                    obscureText: true,
                    
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                   textColor: Colors.white,
                    onPressed:signIn ,
                    child:Text('LOG IN')
                    )
                ],
                
                )
              ),
          ),
        ],
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Future<void> signIn() async {
    await Firebase.initializeApp();
    final formstate=_formkey.currentState;
    formstate.save();
    try{
    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password:_pass);

    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Screenone()));
    
    }
    catch(e){
      print(e.message);
    }

  }
}
