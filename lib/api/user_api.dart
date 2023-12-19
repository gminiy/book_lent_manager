import 'dart:convert';
import 'package:book_lent_manager/dto/user_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  Future<SharedPreferences> _getPrefs() async {
    return SharedPreferences.getInstance();
  }

  Future<List<UserDto>> _getUsersFromPrefs() async {
    final prefs = await _getPrefs();
    final userJsonList = prefs.getStringList('user');

    if (userJsonList == null) {
      return [];
    }

    return userJsonList
        .map((userJson) => UserDto.fromJson(jsonDecode(userJson)))
        .toList();
  }

  Future<UserDto?> getUser(int id) async {
    final List<UserDto> users = await _getUsersFromPrefs();

    for (UserDto user in users) {
      if (user.id == id) {
        return user;
      }
    }

    return null;
  }

  Future<List<UserDto>> getUserAll() async {
    return await _getUsersFromPrefs();
  }
}
