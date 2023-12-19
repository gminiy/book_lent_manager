import 'dart:convert';
import 'package:book_lent_manager/model/book.dart';
import 'package:book_lent_manager/repository/book_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final List<Book> mockBooks = [
    Book(
      id: 0,
      name: 'name',
      isRented: false,
      publishedDate: DateTime(0),
    ),
    Book(
      id: 1,
      name: 'name1',
      isRented: true,
      publishedDate: DateTime(0),
      rentedAt: DateTime(0),
      rentedUserId: 0,
    )
  ];
  List<String> mockBookJsonList =
      mockBooks.map((mockBook) => jsonEncode(mockBook.toJson())).toList();

  SharedPreferences.setMockInitialValues({'book': mockBookJsonList});

  BookRepository bookRepository = BookRepository();

  test('should return all books', () async {
    List<Book> allBooks = await bookRepository.getAllBooks();
    expect(allBooks, mockBooks);
  });

  test('should return book with Id', () async {
    Book? book = await bookRepository.getBook(0);
    expect(book?.toJson(), mockBooks[0].toJson());
  });

  test('add book', () async {
    Book newBook = Book(
      id: 2,
      name: 'name2',
      isRented: true,
      publishedDate: DateTime(0),
      rentedAt: DateTime(0),
      rentedUserId: 1,
    );

    await bookRepository.addBook(newBook);
    mockBooks.add(newBook);
    List<Book> allBooks = await bookRepository.getAllBooks();
    expect(allBooks, mockBooks);
  });
}
