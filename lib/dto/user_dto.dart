class UserDto {
  num? id;
  String? name;
  num? gender;
  String? birthday;
  String? address;
  String? phoneNumber;
  String? createdAt;

  UserDto({
    this.id,
    this.name,
    this.gender,
    this.birthday,
    this.address,
    this.phoneNumber,
    this.createdAt,
  });

  UserDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    birthday = json['birthday'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['gender'] = gender;
    map['birthday'] = birthday;
    map['address'] = address;
    map['phoneNumber'] = phoneNumber;
    map['createdAt'] = createdAt;
    return map;
  }
}
