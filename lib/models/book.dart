import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Book {
  final CollectionReference books =
      FirebaseFirestore.instance.collection('books');

  Book({
    this.sellerId,
    this.isVerified,
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.author,
    @required this.pdfUrl,
    @required this.coverPhotoUrl,
    @required this.language,
    @required this.pages,
    @required this.description,
    @required this.dateTime,
  });

  final String? sellerId;
  final String? id;
  final String? title;
  final num? price;
  final String? author;
  final String? pdfUrl;
  final String? coverPhotoUrl;
  final String? language;
  final int? pages;
  final String? description;
  final bool? isVerified;
  final DateTime? dateTime;

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      sellerId: map['sellerId'],
      title: map['title'],
      price: map['price'],
      author: map['author'],
      pdfUrl: map['pdfUrl'],
      coverPhotoUrl: map['coverPhotoUrl'],
      language: map['language'],
      pages: map['pages'],
      description: map['description'],
      isVerified: map['isVerified'],
      dateTime: map['dateTime'],
    );
  }

  factory Book.fromFirestore(dynamic book) {
    return Book(
      id: book.get('id'),
      // id: book.get('id'),
      sellerId: book.get('sellerId'),
      title: book.get('title'),
      price: book.get('price'),
      author: book.get('author'),
      coverPhotoUrl: book.get('coverPhotoUrl'),
      language: book.get('language'),
      pdfUrl: book.get('pdfUrl'),
      pages: book.get('pages'),
      description: book.get('description'),
      isVerified: book.get('isVerified'),
      dateTime: DateTime.parse(book.get('dateTime')),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sellerId': sellerId,
      'title': title,
      'price': price,
      'author': author,
      'pdfUrl': pdfUrl,
      'coverPhotoUrl': coverPhotoUrl,
      'language': language,
      'pages': pages,
      'description': description,
      'isVerified': false,
      'dateTime': dateTime!.toIso8601String(),
    };
  }

  Future getSellerBooks(String sellerId) async {
    List sellerBooks = [];
    List book = sellerBooks;

    try {
      await books.where('sellerId', isEqualTo: sellerId).get().then((snapshot) {
        snapshot.docs.forEach((element) {
          sellerBooks.add(element.data());
          // sellerBooks.add({'id': element.reference.id});
        });
      });
      print(book);
      return book;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }





  Future getBookList() async {
    List bookList = [];
    try {
      await books.where('isVerified', isEqualTo: true).get().then((snapshot) {
        snapshot.docs.forEach((element) {
          bookList.add(element.data());
        });
      });
      return bookList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
