class UserDto {
  int id;
  String? name;
  int? gender;
  DateTime? birthday;
  String? address;
  String? phoneNumber;
  DateTime? createdAt;

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
      'birthday': birthday,
      'address': address,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt,
    };
  }

  factory UserDto.fromJson(Map<String, dynamic> map) {
    return UserDto(
      id: map['id'] as int,
      name: map['name'] as String,
      gender: map['gender'] as int,
      birthday: map['birthday'] as DateTime,
      address: map['address'] as String,
      phoneNumber: map['phoneNumber'] as String,
      createdAt: map['createdAt'] as DateTime,
    );
  }

//</editor-fold>
}
