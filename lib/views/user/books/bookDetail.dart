import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:masterreads/constants/colors.dart';
import 'package:masterreads/widgets/customTabIndicator.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 25,
        ),
        height: 49,
        color: Colors.transparent,
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Add to library',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            backgroundColor: MaterialStateProperty.resolveWith((states) => kPrimaryColor)
          ),
        ),
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
                          margin: EdgeInsets.only(bottom: 62),
                          width: 225,
                          height: 172,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/images.jpeg'),
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
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 25,
                    ),
                    child: Text(
                      'You\'re A Miracle',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 25,
                    ),
                    child: Text(
                      'Mike Mchargue',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 25,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '\$',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Price',
                          style: TextStyle(
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
                    margin: EdgeInsets.only(
                      top: 23,
                      bottom: 36,
                    ),
                    padding: EdgeInsets.only(
                      left: 25,
                    ),
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
                          width: 30,
                          color: Colors.black,
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              margin: EdgeInsets.only(right: 39),
                              child: Text('Description'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              margin: EdgeInsets.only(right: 39),
                              child: Text('Reviews'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              margin: EdgeInsets.only(right: 39),
                              child: Text('Similar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 25,
                    ),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: TextStyle(
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
