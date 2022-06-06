import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masterreads/models/bookTags.dart';

class BookTagsViewModel {
  final CollectionReference bookTags =
      FirebaseFirestore.instance.collection('bookTags');

  static Future<String?>? addBookTags(BookTags bookTags) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    try {
      var validation = await fireStore
          .collection('bookTags')
          .where('buyerId', isEqualTo: bookTags.buyerId)
          .where('bookId', isEqualTo: bookTags.bookId)
          .get();
      if (validation.docs.isEmpty) {
        DocumentReference reference =
            await fireStore.collection('bookTags').add(bookTags.toMap());
        return reference.id;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getBookTags(String userId) async {
    List cart = [];
    try {
      await bookTags
          .where('buyerId', isEqualTo: userId)
          .where('isPurchased', isEqualTo: false)
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((element) async {
          cart.add(element.data());
        });
      });
      return cart;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
