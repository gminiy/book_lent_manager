import 'package:book_lent_manager/model/book.dart';
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
      'publishedDate': DateTime(0),
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
      'publishedDate': DateTime(0),
      'rentedAt': DateTime(0),
    };

    expect(rentedBook.toJson(), expectBookDtoJson);
  });

  test('book with null fromJson', () {
    //Todo: id 만 같으면 같은 객체로 판단하도록 만들었는데 다른 프로퍼티들이 같은지는 어떻게 테스트할까.
    Book book = Book.fromJson({
      'id': 0,
      'name': 'book',
      'isRented': false,
      'rentedUserId': null,
      'publishedDate': DateTime(0).toString(),
      'rentedAt': null,
    });

    expect(book, rentedBook);
  });

  test('rented book fromJson', () {
    //Todo: id 만 같으면 같은 객체로 판단하도록 만들었는데 다른 프로퍼티들이 같은지는 어떻게 테스트할까.
    Book book = Book.fromJson({
      'id': 0,
      'name': 'book',
      'isRented': true,
      'rentedUserId': 0,
      'publishedDate': DateTime(0).toString(),
      'rentedAt': DateTime(0).toString(),
    });

    expect(book, rentedBook);
  });
}
