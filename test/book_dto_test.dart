import 'package:book_lent_manager/dto/book_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('new bookDto with null', () {
    BookDto(id: 0);
  });

  test('bookDto with null toJson', () {
    BookDto bookDto = BookDto(id: 0);
    print(bookDto.toJson());
  });

  test('bookDto with null fromJson', () {
    BookDto bookDto = BookDto.fromJson({"id": 0});
    BookDto expectBookDto = BookDto(id: 0);
    expect(bookDto, expectBookDto);
  });
}
