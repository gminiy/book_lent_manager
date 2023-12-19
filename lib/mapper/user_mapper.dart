import 'package:book_lent_manager/dto/user_dto.dart';
import 'package:book_lent_manager/model/user.dart';

extension ToUser on UserDto {
  User toUser() {
    return User(
      id: id,
      name: name ?? '이름 없음',
      gender: gender ?? 3,
      birthday: birthday ?? DateTime(0),
      address: address ?? '주소 없음',
      phoneNumber: phoneNumber ?? '연락처 없음',
      createdAt: createdAt ?? DateTime(0),
    );
  }
}
