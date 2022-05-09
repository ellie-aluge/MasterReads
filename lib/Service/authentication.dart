import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masterreads/models/eUser.dart';
import 'package:masterreads/views/home/home.dart';
import 'package:masterreads/views/signUp/register_screen.dart';


import '../views/login/login_screen.dart';

class AuthService{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final signup= const RegisterPage(title:"signup");
  //Auth change user stream
  Stream<User?> get eUser{
    return _auth.authStateChanges();

  }



  //Register with email and password
Future RegisterWithEmail  (String email, String password) async
{
  try{
  UserCredential credentials= await _auth.createUserWithEmailAndPassword(email: email, password: password);
  User? ebookUser = credentials.user;
  return HomePage();


  }


  catch(e)
  {

    print( "an error occured");
    return null;
  }


}

//lOGIN WITH EMAIL AND PASSWORD
  Future SignInWithEmail  (String email, String password) async
  {
    try{
      UserCredential credentials= await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? ebookUser = credentials.user;
      return eUser;
      // return HomePage();


    }


    catch(e)
    {

      print (e.toString());
      return null;


    }


  }


}


