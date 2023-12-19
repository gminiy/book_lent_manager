import 'package:book_lent_manager/model/book.dart';
import 'package:book_lent_manager/util/date_time_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Book notRentedBook = Book(
    id: 0,
    name: 'book',
    isRented: false,
    rentedUserId: null,
    publishedDate: DateTime(0),
    rentedAt: null,
  );
  Book rentedBook = Book(
    id: 0,
    name: 'book',
    isRented: true,
    rentedUserId: 0,
    publishedDate: DateTime(0),
    rentedAt: DateTime(0),
  );

  test('book with null toJson', () {
    Map<String, dynamic> expectBookDtoJson = {
      'id': 0,
      'name': 'book',
      'isRented': false,
      'rentedUserId': null,
      'publishedDate': dateFormatter.format(DateTime(0)),
      'rentedAt': null,
    };

    expect(notRentedBook.toJson(), expectBookDtoJson);
  });

  test('rented book toJson', () {
    Map<String, dynamic> expectBookDtoJson = {
      'id': 0,
      'name': 'book',
      'isRented': true,
      'rentedUserId': 0,
      'publishedDate': dateFormatter.format(DateTime(0)),
      'rentedAt': dateTimeFormatter.format(DateTime(0)),
    };

    expect(rentedBook.toJson(), expectBookDtoJson);
  });

  test('book with null fromJson', () {
    Book book = Book.fromJson({
      'id': 0,
      'name': 'book',
      'isRented': false,
      'rentedUserId': null,
      'publishedDate': dateFormatter.format(DateTime(0)),
      'rentedAt': null,
    });

    expect(book.toJson(), notRentedBook.toJson());
  });

  test('rented book fromJson', () {
    Book book = Book.fromJson({
      'id': 0,
      'name': 'book',
      'isRented': true,
      'rentedUserId': 0,
      'publishedDate': dateFormatter.format(DateTime(0)),
      'rentedAt': dateTimeFormatter.format(DateTime(0)),
    });

    expect(book.toJson(), rentedBook.toJson());
  });
}
