import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masterreads/constants/colors.dart';
import 'package:masterreads/constants/text.dart';
import 'package:masterreads/models/book.dart';
import 'package:masterreads/views/user/books/edit_book_screen/edit_book_screen.dart';
import 'package:masterreads/widgets/customTabIndicator.dart';

class BookDetail extends StatelessWidget {
  BookDetail({
    required this.userId,
    required this.coverUrl,
    required this.title,
    required this.author,
    required this.price,
    required this.description,
  });

  final String userId, coverUrl, title, author, description, price;

  getSellerBooks() async {
    final data = await Book().getSellerBooks(userId);
    if (data.isNotEmpty == true) {
      print(data);
      return data;
    } else if (data.isNotEmpty == false) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 25,
        ),
        height: 49,
        color: Colors.transparent,
        child: FutureBuilder(
          future: getSellerBooks(),
          builder: ((context, snapshot) {
            return TextButton(
              onPressed: () {
                if (snapshot.data != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditBookScreen(),
                    ),
                  );
                }
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => kPrimaryColor)),
              child: Text(
                snapshot.data == null ? 'Add to Library' : 'Edit Book',
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white),
              ),
            );
          }),
        ),
        // TextButton(
        //   onPressed: () {},
        //   style: ButtonStyle(
        //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //       ),
        //       backgroundColor:
        //           MaterialStateProperty.resolveWith((states) => kPrimaryColor)),
        //   child: const Text(
        //     'Add to library',
        //     style: TextStyle(
        //         fontFamily: 'Poppins',
        //         fontWeight: FontWeight.w600,
        //         fontSize: 14,
        //         color: Colors.white),
        //   ),
        // ),
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: kAccentColor,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: kPrimaryColor,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 62),
                          width: 300,
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(coverUrl),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      left: 25,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      left: 25,
                    ),
                    child: Text(
                      author,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      left: 25,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          price == '0' ? '' : '\$',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          price == '0' ? 'FREE' : '${price}',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 32,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 28,
                    margin: const EdgeInsets.only(
                      top: 23,
                      bottom: 36,
                    ),
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                        labelPadding: const EdgeInsets.all(0),
                        indicatorPadding: const EdgeInsets.all(0),
                        isScrollable: true,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        indicator: RoundedRectangleTabIndicator(
                          weight: 2,
                          width: 30,
                          color: Colors.black,
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              margin: const EdgeInsets.only(right: 39),
                              child: const Text('Description'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              margin: const EdgeInsets.only(right: 39),
                              child: const Text('Reviews'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              margin: const EdgeInsets.only(right: 39),
                              child: const Text('Similar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 25,
                    ),
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
