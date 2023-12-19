import 'package:book_lent_manager/dto/book_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('new bookDto with null', () {
    BookDto(id: 0);
  });

  test('bookDto with null toJson', () {
    BookDto bookDto = BookDto(id: 0);
    Map<String, dynamic> expectBookDtoJson = {
      'id': 0,
      'name': null,
      'isRented': null,
      'rentedUserId': null,
      'publishedDate': null,
      'rentedAt': null,
    };

    expect(bookDto.toJson(), expectBookDtoJson);
  });

  test('bookDto with null fromJson', () {
    BookDto bookDto = BookDto.fromJson({'id': 0});
    BookDto expectBookDto = BookDto(id: 0);

    expect(bookDto, expectBookDto);
  });
}
