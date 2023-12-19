import 'dart:convert';
import 'package:book_lent_manager/api/book_api.dart';
import 'package:book_lent_manager/dto/book_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final List<BookDto> mockBookDtoList = [
    BookDto(
      id: 0,
      name: 'name',
      isRented: false,
      publishedDate: DateTime(0),
    ),
    BookDto(
      id: 1,
      name: 'name1',
      isRented: true,
      publishedDate: DateTime(0),
      rentedAt: DateTime(0),
      rentedUserId: 0,
    )
  ];
  List<String> mockBookDtoJsonList = mockBookDtoList
      .map((mockBookDto) => jsonEncode(mockBookDto.toJson()))
      .toList();

  SharedPreferences.setMockInitialValues({'book': mockBookDtoJsonList});
  final BookApi bookApi = BookApi();
  test('get Book', () async {
    const int bookId = 0;
    BookDto? book = await bookApi.getBook(bookId);
    expect(book?.toJson(), mockBookDtoList[0].toJson());
  });

  test('get all Books', () async {
    List<BookDto> bookDtoList = await bookApi.getAllBooks();
    expect(bookDtoList, mockBookDtoList);
  });
}
