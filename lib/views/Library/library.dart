//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// class eLibrary extends StatefulWidget {
//    eLibrary({Key? key}) : super(key: key);
//   List library= [];
//
//   final Stream<QuerySnapshot> payments =
//   FirebaseFirestore.instance.collection('payments').snapshots();
//   @override
//   State<eLibrary> createState() => _eLibraryState();
// }
//
//
// class _eLibraryState extends State<eLibrary> {
//
//   @override
//   void initState() {
//     super.initState();
//     getPayments();
//
//
//   }
//
// getPayments() async{
//
//
//
//   // dynamic data = await BookTagsViewModel().getBookTags(buyerId.uid);
//   // if (data == null) {
//   //   print(failedRetrieveData);
//   // } else {
//   //   setState(() {
//   //     bookTags = data;
//   //   });
//   // }
//   // getCart();
// }
//
//
//   }
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         children: [
//           ListView(
//             physics: const BouncingScrollPhysics(),
//             children: [
//               ListView.builder(
//                 padding: const EdgeInsets.only(
//                   top: 25,
//                   right: 25,
//                   left: 0,
//                 ),
//                 physics: const BouncingScrollPhysics(),
//                 shrinkWrap: true,
//                 primary: false,
//                 itemCount: cart.length,
//
//                 itemBuilder: (context, index) {
//                   amount= double.parse('${cart[index]['price']}');
//                   bookID= '${cart[index]['id']}' ;
//
//
//                   return Container(
//
//
//                     margin: const EdgeInsets.only(
//                         bottom: 19),
//                     height: 81,
//                     width: MediaQuery.of(context)
//                         .size
//                         .width -
//                         50,
//                     color: Colors.white,
//                     child: Row(
//                       children: <Widget>[
//                         Padding(
//                           padding:
//                           const EdgeInsets.only(
//                             right: 0,
//                             left: 0,
//                           ),
//                           child: Checkbox(
//                             value: isCheckout,
//                             onChanged: (newValue) {
//                               isCheckoutState(
//                                   newValue!);
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                           const EdgeInsets.only(
//                               right: 15),
//                           child: IconButton(
//                             onPressed: () async {
//                               cart.removeAt(index);
//
//                               _delete(
//                                   firebaseData[index]
//                                   ['id']);
//
//                               Fluttertoast.showToast(
//                                 msg:
//                                 "Book Deleted successfully",
//                                 toastLength:
//                                 Toast.LENGTH_LONG,
//                               );
//                             },
//                             icon: const Icon(
//                                 Icons.remove_circle),
//                           ),
//                         ),
//
//                         Container(
//                           height: 81,
//                           width: 62,
//                           decoration: BoxDecoration(
//                             borderRadius:
//                             BorderRadius.circular(
//                                 5),
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                   '${cart[index]['coverPhotoUrl']}',
//                                   // 'https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg',
//                                 ),
//                                 fit: BoxFit.fill),
//                             color: kPrimaryColor,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         Column(
//                           mainAxisAlignment:
//                           MainAxisAlignment.center,
//                           crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               '${cart[index]['title'].length > 15 ? cart[index]['title'].substring(0, 15) + '...' : cart[index]['title']}',
//                               // 'Title',
//                               style: const TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontSize: 16,
//                                 fontWeight:
//                                 FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               '${cart[index]['author'].length > 15 ? cart[index]['author'].substring(0, 15) + '...' : cart[index]['author']}',
//                               // '${cart[index]['author']}',
//                               // 'Author',
//                               style: const TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontSize: 10,
//                                 fontWeight:
//                                 FontWeight.w400,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               cart[index]['price'] == 0
//                                   ? 'FREE'
//                                   : '\$'
//                                   '${cart[index]['price']}',
//                               // 'Price',
//                               style: const TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontSize: 14,
//                                 fontWeight:
//                                 FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ],
//           )
//         ],
//       ),
//
//     );
//   }
// }
//
