import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class eUserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;

  eUserModel({this.uid, this.email, this.firstName, this.secondName});

  // receiving data from server
  factory eUserModel.fromMap(map) {
    return eUserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}
