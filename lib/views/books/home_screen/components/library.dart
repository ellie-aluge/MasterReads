import 'package:flutter/material.dart';
import 'package:masterreads/components/book_item.dart';
import 'package:masterreads/models/book.dart';
import 'package:masterreads/providers/books_provider.dart';
import 'package:provider/provider.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Book?>? _libraryBooks = Provider.of<Books>(context).libraryBooks;

    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 240,
      ),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
      physics: NeverScrollableScrollPhysics(),
      children: _libraryBooks!.map((Book? book) {
        return DefaultBookItem(book);
      }).toList(),
    );
  }
}
