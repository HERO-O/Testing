import 'package:flutter/material.dart';
import 'package:testing/Login/logintest.dart';
import 'package:testing/Login/signup.dart';

class Home extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
   return Scaffold(
     
   
   body:Column(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children:[Spacer(),
     Center(
      
     child:Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
     children:[ 
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              child:Text("WELCOME TO YELLOW CLASS",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),)
                   
            ),
          ),
        ),
        Row(
         
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
           
           Expanded(
             child: Container(
               height:50,
               child: RaisedButton(
                 
                 color: Colors.blueAccent,
                  textColor: Colors.white,
                 hoverElevation: 20,
                onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>Signup()));
                },
                child: Text("SIGN UP",),
                ),
             ),
           ),]),
           Container(
             height: 10,
           ),
           Row(
            children:[Expanded(
              child: Container(
                height: 50,
                child: RaisedButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage()));
                },
                child: Text("LOG IN"),
                ),
              ),
            )
        ],
       ),]),
     )
   ),Spacer()]
   ),);
  }
}
