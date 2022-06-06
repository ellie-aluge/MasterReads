import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookTags {
  BookTags({
    @required this.bookId,
    @required this.buyerId,
    @required this.isPurchased,
  });

  final String? bookId;
  final String? buyerId;
  final bool? isPurchased;

  factory BookTags.fromMap(Map<String, dynamic> map) {
    return BookTags(
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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookId': bookId,
      'buyerId': buyerId,
      'isPurchased': isPurchased,
    };
  }
}
