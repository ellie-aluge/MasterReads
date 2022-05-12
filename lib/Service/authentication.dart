import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:masterreads/models/eUser.dart';
import 'package:masterreads/views/home/home.dart';
import 'package:masterreads/views/profilePage.dart';
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
Future RegisterWithEmail  (String email, String password, final firstNameController, final secondNameController) async
{

  try {
    UserCredential credentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User? ebookUser = credentials.user;
    postDetailsToFirestore(firstNameController, secondNameController);
    return ebookUser;

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
      return ebookUser;

      // return HomePage();


    }


    catch(e)
    {

      print (e.toString());
      return null;


    }


  }



  postDetailsToFirestore(final firstNameController, final secondNameController) async {
    // calling our firestore
    // calling our user model
    // sedning these values


    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    eUserModel userModel = eUserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.secondName = secondNameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");



  }

}
