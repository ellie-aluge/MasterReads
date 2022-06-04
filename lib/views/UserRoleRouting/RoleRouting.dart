import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebasetest/screens/adminscreen.dart';
// import 'package:firebasetest/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:masterreads/routes/routes.dart';
import 'package:masterreads/views/Admin/adminHomepage.dart';
import 'package:masterreads/views/user/books/bookList.dart';
import 'package:masterreads/Service/authentication.dart';
import 'package:provider/provider.dart';
import 'package:snap/snap.dart';

class RoleRouting extends StatefulWidget {
  const RoleRouting({Key? key}) : super(key: key);
  @override
  State <RoleRouting> createState() => _RoleRouting();

}

class _RoleRouting extends State<RoleRouting>  with TickerProviderStateMixin  {
  String role = 'buyer';
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    _checkRole();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
  }



  void _checkRole() async {

    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
    print ("This id:");
    print(user?.uid);
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: user?.email).get();
    setState(() {


      role = snapshot.docs[0]['role'];
      // role=snap[role];
    });

    if(role == 'buyer' ||role=="seller"){


      navigateNext(BookList());
    }
    else if(role == 'admin'){
      navigateNext(adminHomePage());
    }
  }

  void navigateNext(Widget route) {
    Timer(Duration(milliseconds: 300), () {

      // Navigator.pushNamed(context, AppRoutes.routeBookDetail);
      Navigator.push(context, MaterialPageRoute(builder: (_) => route));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Loading',
              style: TextStyle(fontSize: 20),
            ),
            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Loading',
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text('Welcome'),
    //
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             ElevatedButton(
    //                 onPressed: () {
    //
    //                   context.read<AuthService>().signOut();
    //                 },
    //                 child: Text("Sign Out"))
    //           ],
    //         ),
    //       ],
    //     ),
    //
    //   ),
    // );
  }
}
