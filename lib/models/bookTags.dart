import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookTags {

  String? tagID;
   String? bookId;
   String? buyerId;
  bool? isPurchased;

  BookTags(  {

  this.bookId,
    this.buyerId,
    this.isPurchased,
    this.tagID,
  });



  factory BookTags.fromMap(Map<String, dynamic> map) {
    return BookTags(
      tagID: map['tagID'],
      bookId: map['bookId'],
      buyerId: map['buyerId'],
      isPurchased: map['isPurchased'],
    );
  }

  factory BookTags.fromFirestore(Map<String, dynamic> map) {
    return BookTags(
      bookId: map['bookId'],
      buyerId: map['buyerId'],
      isPurchased: map['isPurchased'],
      tagID: map['tagID'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookId': bookId,
      'buyerId': buyerId,
      'isPurchased': isPurchased,
      'tagID': tagID,
    };
  }
}
