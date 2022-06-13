import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class payment {
  String? uid;
  String? paymentid;
  String? email;
  double? amount;
  String? status;


  payment({this.paymentid, this.status, this.uid, this.email, this.amount, });

  // receiving data from server
  factory payment.fromMap(map) {
    return payment(
      paymentid: map['paymentid'],
      uid: map['uid'],
      email: map['email'],
      amount: map['amount'],
      status: map['status'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'amount': amount,
      'status': status,

    };
  }
}
