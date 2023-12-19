import 'dart:convert';
import 'package:book_lent_manager/dto/book_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookApi {
  Future<SharedPreferences> _getPrefs() async {
    return SharedPreferences.getInstance();
  }

  Future<List<BookDto>> _getAllBooksFromPrefs() async {
    final prefs = await _getPrefs();
    final bookJsonList = prefs.getStringList('book');

    if (bookJsonList == null) {
      return [];
    }

    return bookJsonList
        .map((bookJson) => BookDto.fromJson(jsonDecode(bookJson)))
        .toList();
  }

  Future<BookDto?> getBook(int id) async {
    final List<BookDto> books = await _getAllBooksFromPrefs();

    for (BookDto book in books) {
      if (book.id == id) {
        return book;
      }
    }

    return null;
  }

  Future<List<BookDto>> getAllBooks() async {
    return await _getAllBooksFromPrefs();
  }
}
