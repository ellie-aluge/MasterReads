import 'package:cloud_firestore/cloud_firestore.dart';

class BookViewModel {
  final CollectionReference books =
      FirebaseFirestore.instance.collection('books');

  Future getCartBooks(List bookTags) async {
    try {
      List bookList = [];
      try {
        for (int index = 0; index < bookTags.length; index++) {
          await books
              .where('id', isEqualTo: bookTags[index]['bookId'])
              .get()
              .then((snapshot) {
            snapshot.docs.forEach((element) {
              bookList.add(element.data());
            });
          });
        }
        print(bookList);
        return bookList;
      } catch (e) {
        print(e.toString());
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
