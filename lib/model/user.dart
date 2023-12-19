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

  Map<String, dynamic> toMap() {
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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
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
