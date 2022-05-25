import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masterreads/Service/authentication.dart';
import 'package:masterreads/constants/colors.dart';
import 'package:masterreads/views/login/login_screen.dart';
import 'package:masterreads/widgets/bottomBar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late String email, firstName, secondName, role;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 249, 250, 255),
                  kPrimaryColor,
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 38),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.read<AuthService>().signOut();
                            },
                            child: Text("Sign Out"))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                      future: _fetch(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done)
                          return Text("Loading data...");
                        return Text(
                          '$role' == 'seller' ? 'Seller' : 'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Nisebuschgardens'),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: height * 0.4,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double innerHeight = constraints.maxHeight;
                          double innerWidth = constraints.maxWidth;
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: innerHeight * 0.65,
                                  width: innerWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 70,
                                      ),
                                      FutureBuilder(
                                        future: _fetch(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState !=
                                              ConnectionState.done)
                                            return Text("Loading data...");
                                          return Text(
                                            '$firstName $secondName',
                                            style: TextStyle(
                                              color: kPrimaryColor,
                                              fontFamily: 'Poppins',
                                              fontSize: 30,
                                            ),
                                          );
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Books',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontFamily: 'Poppins',
                                                  fontSize: 21,
                                                ),
                                              ),
                                              Text(
                                                '10',
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 21,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 25,
                                              vertical: 8,
                                            ),
                                            child: Container(
                                              height: 40,
                                              width: 5,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Pending',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontFamily: 'Poppins',
                                                  fontSize: 21,
                                                ),
                                              ),
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 21,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    child: CircleAvatar(
                                      radius: 75,
                                      backgroundImage: AssetImage(
                                        'assets/images/logo.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: height * 0.5,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'My Books',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 25,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Divider(
                              thickness: 2.5,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomBar(),
        ],
      );
    }
    return const LoginPage(title: 'Login UI');
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        email = ds.data()!['email'];
        firstName = ds.data()!['firstName'];
        secondName = ds.data()!['secondName'];
        role = ds.data()!['role'];
      }).catchError((e) {
        print(e);
      });
    }
  }
}
