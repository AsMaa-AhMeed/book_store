import 'package:book_store/models/book_data_model.dart';
import 'package:dio/dio.dart';

class BookRepository {
  Future<List<Book>> getBookData() async {
    final response = await Dio().get('https://api.itbook.store/1.0/new');

    final bookData = List<Book>.from(response.data['books'].map((element) {
      return Book(
          title: element['title'],
          subtitle: element['subtitle'],
          isbn13: element['isbn13'],
          price: element['price'],
          image: element['image'],
          url: element['url']);
    }));

    return bookData;
  }
}
