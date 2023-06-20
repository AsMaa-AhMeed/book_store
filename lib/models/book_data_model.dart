class BookRepoModel {
  BookRepoModel({
    required this.error,
    required this.total,
    required this.books,
  });

  String error;
  String total;
  List<Book> books;
}

class Book {
  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  String title;
  String subtitle;
  String isbn13;
  String price;
  String image;
  String url;
}
