import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masterreads/Service/authentication.dart';
import 'package:masterreads/constants/colors.dart';
import 'package:masterreads/constants/text.dart';
import 'package:masterreads/models/book.dart';
import 'package:masterreads/routes/routes.dart';
import 'package:masterreads/views/login/login_screen.dart';
import 'package:masterreads/views/user/books/bookDetail.dart';
import 'package:masterreads/widgets/buyer/buyerWidgets.dart';
import 'package:masterreads/widgets/seller/sellerWidgets.dart';
import 'package:masterreads/widgets/bottomBar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late String id, email, firstName, secondName, role;
  List sellerBooks = [];

  @override
  void initState() {
    super.initState();
    getSellerBooks();
  }

  getSellerBooks() async {
    final sellerId = FirebaseAuth.instance.currentUser!;
    dynamic data = await Book().getSellerBooks(sellerId.uid);

    if (data == null) {
      print(failedRetrieveData);
    } else {
      setState(() {
        sellerBooks = data;
      });
    }
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    id = firebaseUser.uid;
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
        // ignore: avoid_print
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
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
                            child: const Text("Sign Out"))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                      future: _fetch(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done)
                          return const Text(loadingData);
                        return Text(
                          '$role' == 'seller' ? 'Seller' : 'Profile',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Nisebuschgardens'),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
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
                                      const SizedBox(
                                        height: 70,
                                      ),
                                      FutureBuilder(
                                        future: _fetch(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState !=
                                              ConnectionState.done) {
                                            return const Text(loadingData);
                                          }
                                          return Text(
                                            '$firstName $secondName',
                                            style: const TextStyle(
                                              color: kPrimaryColor,
                                              fontFamily: 'Poppins',
                                              fontSize: 30,
                                            ),
                                          );
                                        },
                                      ),
                                      FutureBuilder(
                                        future: _fetch(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState !=
                                              ConnectionState.done) {
                                            return const Text(loadingData);
                                          }
                                          if ('$role' == 'seller') {
                                            return sellerBooksCount(
                                                sellerBooks);
                                          } else if ('$role' == 'buyer') {
                                            return buyerBooksCount();
                                          }
                                          return Container();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 75,
                                    backgroundImage: AssetImage(
                                      'assets/images/logo.png',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    FutureBuilder(
                      future: _fetch(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done)
                          return const Text(loadingData);
                        if ('$role' == 'seller') {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.routeAddBook);
                                },
                                child: const Text('Upload Book'),
                              ),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: height * 0.65,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                const Text(
                                  'My Books',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 25,
                                    fontFamily: 'Poppins',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const Divider(
                                  thickness: 2.5,
                                ),
                                ListView.builder(
                                  padding: const EdgeInsets.only(
                                    top: 25,
                                    right: 25,
                                    left: 25,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: sellerBooks.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => BookDetail(
                                              userId: id,
                                              coverUrl: sellerBooks[index]
                                                  ['coverPhotoUrl'],
                                              title: sellerBooks[index]
                                                  ['title'],
                                              author: sellerBooks[index]
                                                  ['author'],
                                              price: sellerBooks[index]['price']
                                                  .toString(),
                                              description: sellerBooks[index]
                                                  ['description'],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 19),
                                        height: 81,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                50,
                                        color: Colors.white,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              height: 81,
                                              width: 62,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      '${sellerBooks[index]['coverPhotoUrl']}',
                                                    ),
                                                    fit: BoxFit.fill),
                                                color: kPrimaryColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '${sellerBooks[index]['title'].length > 27 ? sellerBooks[index]['title'].substring(0, 27) + '...' : sellerBooks[index]['title']}',
                                                  style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '${sellerBooks[index]['author']}',
                                                  style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  sellerBooks[index]['price'] ==
                                                          0
                                                      ? 'FREE'
                                                      : '\$'
                                                          '${sellerBooks[index]['price']}',
                                                  style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                FutureBuilder(
                                                  future: _fetch(),
                                                  builder: (context, snapshot) {
                                                    if (snapshot
                                                            .connectionState !=
                                                        ConnectionState.done) {
                                                      return const Text(
                                                          loadingData);
                                                    }
                                                    if (role == 'seller') {
                                                      return Text(
                                                        '${sellerBooks[index]['isVerified']}' ==
                                                                'true'
                                                            ? 'Published'
                                                            : 'On Review',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              '${sellerBooks[index]['isVerified']}' ==
                                                                      'true'
                                                                  ? Colors.green
                                                                  : Colors.red,
                                                        ),
                                                      );
                                                    }
                                                    return Container();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const BottomBar(),
        ],
      );
    }
    return const LoginPage(title: 'Login UI');
  }
}
