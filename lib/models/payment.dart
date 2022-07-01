import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Payment {
  String? uid;
  String? paymentid;
  double? amount;
  String? bookid;
  String? date;



  Payment({this.paymentid,  this.bookid, this.uid, this.amount, this.date});

  // receiving data from server
  factory Payment.fromMap(map) {
    return Payment(
      paymentid: map['paymentid'],
      uid: map['uid'],
      amount: map['amount'],
      bookid:map['bookid'],
      date:map['date'],


    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'paymentid':paymentid,
      'uid': uid,
      'amount': amount,
      'bookid':bookid,
      'date':date,

    };


  }

// Future getUserPayments (String buyerId) async
//   // {
//   //   List paymentList = [];
//   //   try {
//   //     await payments
//   //         .where('buyerId', isEqualTo: userId)
//   //
//   //         .get()
//   //         .then((snapshot) {
//   //       snapshot.docs.forEach((element) async {
//   //         paymentList.add(element.data());
//   //       });
//   //     });
//   //     return paymentList;
//   //   } catch (e) {
//   //     print(e.toString());
//   //     return null;
//   //   }
//   //
//   // }
//
 }
