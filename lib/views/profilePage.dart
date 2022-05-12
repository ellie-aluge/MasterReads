import 'package:flutter/material.dart';
import 'package:masterreads/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profilepage extends StatefulWidget {
  static const String screenRoute = 'profile';

  const profilepage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<profilepage> createState() => profile();
}

class profile extends State<profilepage> {
  final _auth = FirebaseAuth.instance;
  late User SignInUser;

  @override
  void initState() {
    super.initState();
    getCurntUser();
  }

  void getCurntUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        SignInUser = user;
        print(SignInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 141, 102, 210),
        ),
        body: SafeArea(
          child: Column(

            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.person_outline,
                    color: Colors.deepPurple,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Your name", labelText: "Name"),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.settings_phone,
                    color: Colors.deepPurple,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Your phone", labelText: "phone"),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.deepPurple,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Your Email", labelText: "Email"),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.deepPurple,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Your address", labelText: "address"),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.https,
                    color: Colors.deepPurple,
                  ),
                  title: Text(
                    'individual',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    ' account type ',
                    style: TextStyle(color: Colors.black, fontSize: 12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
