import 'dart:convert';
import 'package:book_lent_manager/api/book_api.dart';
import 'package:book_lent_manager/dto/book_dto.dart';
import 'package:book_lent_manager/model/book.dart';
import 'package:book_lent_manager/mapper/book_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookRepository {
  final _bookApi = BookApi();

  Future<List<Book>> getAllBooks() async {
    final List<BookDto> bookDtoList = await _bookApi.getAllBooks();
    return bookDtoList.map((bookDto) => bookDto.toBook()).toList();
  }

  Future<Book?> getBook(int id) async {
    final BookDto? bookDto = await _bookApi.getBook(id);
    return bookDto?.toBook();
  }

  Future<void> addBook(Book book) async {
    final List<BookDto> bookDtoList = await _bookApi.getAllBooks();
    bookDtoList.add(book.toBookDto());
    List<String> bookDtoJsonList =
        bookDtoList.map((bookDto) => jsonEncode(bookDto)).toList();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('book', bookDtoJsonList);
  }
}
