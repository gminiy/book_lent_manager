import 'package:book_lent_manager/dto/book_dto.dart';
import 'package:book_lent_manager/model/book.dart';

extension ToBook on BookDto {
  Book toBook() {
    return Book(
      id: id,
      name: name ?? '이름 없음',
      isRented: isRented ?? false,
      rentedUserId: rentedUserId,
      publishedDate: publishedDate ?? DateTime(0),
      rentedAt: rentedAt,
    );
  }
}
