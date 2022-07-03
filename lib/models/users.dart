import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class eUserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? role;

  eUserModel(
      {this.role, this.uid, this.email, this.firstName, this.secondName});

  // receiving data from server
  factory eUserModel.fromMap(map) {
    return eUserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      role: map['role'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'role': role,
    };
  }

  Future getDisplayName(String userId) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    List user = [];

    await users
        .where('uid', isEqualTo: userId)

        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) async {
        user.add(element.data());
      });
    });
    String name="";
    for(int i=0; i<user.length;i++)
      {
        name= user[i]['firstName'] + user[i]['secondName'];
      }
print (name);
    return name;
  }
}

