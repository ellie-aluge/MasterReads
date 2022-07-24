import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masterreads/constants/colors.dart';
import 'package:masterreads/widgets/customTabIndicator.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:mailer/mailer.dart';

class AdminBookDetail extends StatelessWidget {
  var id;

  AdminBookDetail(

      {required this.coverUrl,
        required this.title,
        required this.author,

        required this.id,
        required this.price,
        required this.description});

  final String coverUrl, title, author, description, price;
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
        child: TextButton(
          onPressed: () {
            // sendEmail;
            // FirebaseFirestore.instance.collection('books').doc('id').update({'isVerified': 'true'});

            // final washingtonRef = FirebaseFirestore.instance.collection("books").where(sellerIddoc);
            // washingtonRef.update({"isVerified": true}).then(
            //         (value) => print("DocumentSnapshot successfully updated!"),
            //     onError: (e) => print("Error updating document $e"));


          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              backgroundColor:
              MaterialStateProperty.resolveWith((states) => kPrimaryColor)),
          child: const Text(
            'Approve',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white),
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
                      length: 1,
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



    // await FlutterEmailSender.send(email);
  }
  // Future  sendEmail; async(
  // {dynamic email= ('milke, johannesegna1l. com')}
  //
  // final message = Message()
  //   ..from = Address(email, "Johannes")
  //     .. recipients = ('milke. johannesegma1l. com ')
  //     .. subject = 'Hello Johannes'
  //     ..text = 'This is a test email!";
  //   )
}
