import 'dart:convert';
import 'package:book_lent_manager/api/user_api.dart';
import 'package:book_lent_manager/dto/user_dto.dart';
import 'package:book_lent_manager/model/user.dart';
import 'package:book_lent_manager/mapper/user_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final _userApi = UserApi();

  Future<List<User>> getAllUsers() async {
    final List<UserDto> userDtoList = await _userApi.getAllUsers();
    return userDtoList.map((userDto) => userDto.toUser()).toList();
  }

  Future<User?> getUser(int id) async {
    final UserDto? userDto = await _userApi.getUser(id);
    return userDto?.toUser();
  }

  Future<void> addUser(User user) async {
    final List<UserDto> userDtoList = await _userApi.getAllUsers();
    userDtoList.add(user.toUserDto());
    List<String> userDtoJsonList =
        userDtoList.map((userDto) => jsonEncode(userDto)).toList();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('user', userDtoJsonList);
  }
}
