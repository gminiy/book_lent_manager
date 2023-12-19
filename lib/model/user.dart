import 'package:book_lent_manager/dto/user_dto.dart';
import 'package:book_lent_manager/util/date_time_formatter.dart';

class User {
  int id;
  String name;
  int gender;
  DateTime birthday;
  String address;
  String phoneNumber;
  DateTime createdAt;

//<editor-fold desc="Data Methods">
  User({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthday,
    required this.address,
    required this.phoneNumber,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User && runtimeType == other.runtimeType && id == other.id);

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'User{ id: $id, name: $name, gender: $gender, birthday: $birthday, address: $address, phoneNumber: $phoneNumber, createdAt: $createdAt,}';
  }

  User copyWith({
    required int id,
    required String name,
    required int gender,
    required DateTime birthday,
    required String address,
    required String phoneNumber,
    required DateTime createdAt,
  }) {
    return User(
      id: this.id,
      name: this.name,
      gender: this.gender,
      birthday: this.birthday,
      address: this.address,
      phoneNumber: this.phoneNumber,
      createdAt: this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'birthday': dateFormatter.format(birthday),
      'address': address,
      'phoneNumber': phoneNumber,
      'createdAt': dateTimeFormatter.format(createdAt),
    };
  }

  UserDto toUserDto() {
    return UserDto(
      id: id,
      name: name,
      gender: gender,
      birthday: birthday,
      address: address,
      phoneNumber: phoneNumber,
      createdAt: createdAt,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      gender: json['gender'] as int,
      birthday: DateTime.parse(json['birthday'] as String),
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
//</editor-fold>
}
