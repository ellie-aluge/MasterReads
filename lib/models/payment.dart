import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class payment {
  String? uid;
  String? paymentid;
  String? email;
  double? amount;
  String? bookid;



  payment({this.paymentid,  this.bookid, this.uid, this.email, this.amount, });

  // receiving data from server
  factory payment.fromMap(map) {
    return payment(
      paymentid: map['paymentid'],
      uid: map['uid'],
      email: map['email'],
      amount: map['amount'],
      bookid:map['bookid'],


    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'amount': amount,
      'bookid':bookid,


    };
  }
}
