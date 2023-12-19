import 'package:book_lent_manager/dto/book_dto.dart';
import 'package:book_lent_manager/model/book.dart';
import 'package:book_lent_manager/mapper/book_mapper.dart';
import 'package:book_lent_manager/util/date_time_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return Book', () {
    Book book = BookDto(id: 0).toBook();
    Map<String, dynamic> expectBookJson = {
      'id': 0,
      'name': '이름 없음',
      'isRented': false,
      'rentedUserId': null,
      'publishedDate': dateFormatter.format(DateTime(0)),
      'rentedAt': null,
    };
    expect(book.toJson(), expectBookJson);
  });
}
