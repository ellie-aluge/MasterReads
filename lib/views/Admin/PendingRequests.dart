import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masterreads/constants/colors.dart';
import 'package:masterreads/constants/text.dart';
import 'package:masterreads/models/book.dart';
import 'package:masterreads/utils/search.dart';
import 'package:masterreads/views/Admin/adminBookDetails.dart';
import 'package:masterreads/views/user/books/bookDetail.dart';
import 'package:masterreads/views/user/books/searchBook.dart';
import 'package:masterreads/widgets/bottomBar.dart';
import 'package:masterreads/widgets/customTabIndicator.dart';
class PendingRequests extends StatefulWidget {
  const PendingRequests({Key? key}) : super(key: key);

  @override
  State<PendingRequests> createState() => _PendingRequestsState();
}

class _PendingRequestsState extends State<PendingRequests> {
  List bookList = [];

  @override
  void initState() {
    super.initState();
    getBookList();
  }

  getBookList() async {
    dynamic data = await Book().getNonVerifiedBookList();

    if (data == null) {
      print(failedRetrieveData);
    } else {
      setState(() {
        bookList = data;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('Pending Requests')),
      body: Container(
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[

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
                      itemCount: bookList.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // if (bookList[index]['isVerified']) {
                        return GestureDetector(

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>

                                    AdminBookDetail(
                                      coverUrl: bookList[index]['coverPhotoUrl'],
                                      title: bookList[index]['title'],
                                      author: bookList[index]['author'],
                                      price: bookList[index]['price']
                                          .toString(),
                                      description: bookList[index]['description'],
                                      id: bookList[index]['id'],

                                    ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 19),
                            height: 210,
                            width: 153,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kPrimaryColor,
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${bookList[index]['coverPhotoUrl']}',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                        // }
                        // else
                        //   return Container(
                        //
                        //   );
                      }
                  ),
                ),

              ],
            ),
          ],
        ),
      ),

    );

  }

}