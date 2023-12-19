import 'dart:convert';

import 'package:book_lent_manager/model/user.dart';
import 'package:book_lent_manager/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final List<User> mockUsers = [
    User(
      id: 0,
      name: 'name',
      gender: 1,
      birthday: DateTime.now(),
      address: 'address',
      phoneNumber: '010-0000-0000',
      createdAt: DateTime.now(),
    ),
    User(
      id: 1,
      name: 'name1',
      gender: 2,
      birthday: DateTime.now(),
      address: 'address1',
      phoneNumber: '010-1111-1111',
      createdAt: DateTime.now(),
    )
  ];
  List<String> mockUserList =
      mockUsers.map((mockUser) => jsonEncode(mockUser.toJson())).toList();

  SharedPreferences.setMockInitialValues({'user': mockUserList});

  UserRepository userRepository = UserRepository();

  test('should return all users', () async {
    List<User> allUsers = await userRepository.getAllUsers();
    expect(allUsers, mockUsers);
  });

  test('should return user with Id', () async {
    User? user = await userRepository.getUser(0);
    expect(user, mockUsers[0]);
  });

  test('add user', () async {
    User newUser = User(
      id: 2,
      name: 'name2',
      gender: 1,
      birthday: DateTime.now(),
      address: 'address2',
      phoneNumber: '010-2222-2222',
      createdAt: DateTime.now(),
    );

    await userRepository.addUser(newUser);
    mockUsers.add(newUser);
    List<User> allUsers = await userRepository.getAllUsers();
    expect(allUsers, mockUsers);
  });
}
