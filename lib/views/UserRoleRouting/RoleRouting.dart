import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebasetest/screens/adminscreen.dart';
// import 'package:firebasetest/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:masterreads/views/Admin/adminHomepage.dart';

class RoleRouting extends StatefulWidget {
  @override
  State <RoleRouting> createState() => _RoleRouting();

}

class _RoleRouting extends State<RoleRouting> {
  String role = 'user';

  @override
  void initState() {
    super.initState();
    _checkRole();
  }

  void _checkRole() async {
    // User user = FirebaseAuth.instance.currentUser;
    // final DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    // setState(() {
    //   role = snap['role'];
    // });

    if(role == 'user'){
      navigateNext(adminHomePage());
    } else if(role == 'admin'){
      navigateNext(adminHomePage());
    }
  }

  void navigateNext(Widget route) {
    Timer(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome'),
          ],
        ),
      ),
    );
  }
}
