import "package:flutter/material.dart";
import 'package:masterreads/Service/authentication.dart';
import 'package:masterreads/constants/colors.dart';
import 'package:masterreads/views/Admin/ApprovedRequests.dart';
import 'package:masterreads/views/Admin/ListUsers.dart';
import 'package:masterreads/views/Admin/PendingRequests.dart';
import 'package:masterreads/views/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';




class adminHomePage extends StatefulWidget {
  const adminHomePage({Key? key}) : super(key: key);

  @override
  State<adminHomePage> createState() => _adminHomePageState();
}

class _adminHomePageState extends State<adminHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
    body: Stack
      (
      children: <Widget> [



        Expanded(
        child: GridView.count(
          padding: EdgeInsets.all(20),
          mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          crossAxisCount: 2,
            primary:false,
            children:<Widget>[
              Card(

                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation:6,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserModel()));
          },

                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children :<Widget> [
                    Image.asset('assets/images/user.png',
                    height: 130,),
                    const Text(
                      "Users",
                    )
                  ],
                ),

              ),
              ),


              Card(

                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),

                ),
                elevation:6,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApprovedRequests()));
                },

                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children :<Widget> [
                    Image.asset('assets/images/approved.png',
                      height: 130,),
                    Text(
                      "Approved Books",
                    )
                  ],
                ),

              ),
    ),



              Card(


                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation:6,

                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children :<Widget> [
                    Image.asset('assets/images/rejected.png',
                      height: 130,),
                    Text(
                      "Rejected Books",
                    )
                  ],
                ),

              ),


              Card(



                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation:6,

                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PendingRequests()));
                  },

                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children :<Widget> [
                      Image.asset('assets/images/reminder.png',
                        height: 130,),
                      Text(
                        "Pending",
                      )
                    ],
                  ),
                ),


              ),

             Container(
                 child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthService>().signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage(title:"Log in")));
                      },
                      child: const Text("Sign Out"))
              ),
            ],

        ),
        ),
      ],


    )


    );
  }
}
