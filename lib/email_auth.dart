
import 'package:demo/functions/authFunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailAuth extends StatefulWidget {
  const EmailAuth({super.key});

  @override
  State<EmailAuth> createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email ='';
  String password ='';
  String username='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Email/Pass Auth'),
        
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             !isLogin? TextFormField(
                key: ValueKey('username'),
                decoration: InputDecoration(
                  hintText: 'Enter the username'
                ),validator:(value){
                  if(value.toString().length<3){
                    return 'Username is so small';
                  }
                  else{
                    return null;
                  }
                } ,
                onSaved: (value){
                  setState(() {
                    username = value!;
                  });
                },

              ):Container(),
              TextFormField(
                key: ValueKey('email'), 
                decoration: InputDecoration(
                  hintText: 'Enter email id'
                ),validator:(value){
                  if(!(value.toString().contains('@'))){
                    return 'Invalid email';
                  }
                  else{
                    return null;
                  }
                } ,
                onSaved: (value){
                  setState(() {
                    email = value!;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                key: ValueKey('password'),
                decoration: InputDecoration(
                  hintText: 'Enter password'
                ),validator:(value){
                  if(value.toString().length<6){
                    return 'Password is so small';
                  }
                  else{
                    return null;
                  }
                } ,
                onSaved: (value){
                  setState(() {
                    password = value!;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: (){
                      if(_formkey.currentState!.validate()){
                        _formkey.currentState!.save();
                       isLogin? signin(email, password) :signup(email, password);
                      }
                }, child:isLogin?Text('Login'): Text('Sign-up')),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(onPressed: (){
                setState(() {
                  isLogin =!isLogin;
                });
              }, child:isLogin? Text("Don't have an account? Signin"): Text('Already Signed up ? Login')),
               SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed:(){
                signInWithGoogle();
              } , 
              child: Text('Google signin'))
            ],
          ),
        
        ),
      
      ),
    );
  }
}