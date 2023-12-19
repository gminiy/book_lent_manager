import 'package:book_lent_manager/util/date_time_formatter.dart';
import 'package:intl/intl.dart';

class UserDto {
  int id;
  String? name;
  int? gender;
  DateTime? birthday;
  String? address;
  String? phoneNumber;
  DateTime? createdAt;
  final DateFormat createdAtFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  final DateFormat birthdayFormatter = DateFormat('yyyy-MM-dd');

//<editor-fold desc="Data Methods">
  UserDto({
    required this.id,
    this.name,
    this.gender,
    this.birthday,
    this.address,
    this.phoneNumber,
    this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDto && runtimeType == other.runtimeType && id == other.id);

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'UserDto{ id: $id, name: $name, gender: $gender, birthday: $birthday, address: $address, phoneNumber: $phoneNumber, createdAt: $createdAt,}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'birthday': birthday != null ? dateFormatter.format(birthday!) : null,
      'address': address,
      'phoneNumber': phoneNumber,
      'createdAt':
          createdAt != null ? dateTimeFormatter.format(createdAt!) : null,
    };
  }

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int,
      name: json['name'],
      gender: json['gender'],
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

//</editor-fold>
}
