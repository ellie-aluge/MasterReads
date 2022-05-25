import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:masterreads/constants/colors.dart';
import 'package:masterreads/routes/routes.dart';
import 'package:masterreads/widgets/bottomBar.dart';
import 'package:masterreads/widgets/customTabIndicator.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Let's Reading !",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Discover Latest Book",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 39,
                  margin: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 18,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Stack(
                    children: <Widget>[
                      TextField(
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 19,
                            right: 50,
                            bottom: 8,
                          ),
                          border: InputBorder.none,
                          hintText: 'Search book..',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 39,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kPrimaryColor,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.symmetric(),
                            onPressed: () {},
                            icon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(left: 25),
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                      labelPadding: EdgeInsets.all(0),
                      indicatorPadding: EdgeInsets.all(0),
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      indicator: RoundedRectangleTabIndicator(
                        weight: 2,
                        width: 10,
                        color: Colors.black,
                      ),
                      tabs: [
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('New'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('Trending'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('Best Seller'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 21,
                  ),
                  height: 210,
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 6,
                    ),
                    itemCount: 6,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.routeBookDetail);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 19),
                          height: 210,
                          width: 153,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kPrimaryColor,
                            image: DecorationImage(
                              image: AssetImage('assets/images/images.jpeg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 25),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.only(
                    top: 25,
                    right: 25,
                    left: 25,
                  ),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.routeBookDetail);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 19),
                        height: 81,
                        width: MediaQuery.of(context).size.width - 50,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 81,
                              width: 62,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/images.jpeg'),
                                  fit: BoxFit.fill,
                                ),
                                color: kPrimaryColor,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Title will be here',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Author',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '\$' + 'Price',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
