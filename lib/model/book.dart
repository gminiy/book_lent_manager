class Book {
  int id;
  String name;
  bool isRented;
  int? rentedUserId;
  DateTime publishedDate;
  DateTime? rentedAt;

//<editor-fold desc="Data Methods">
  Book({
    required this.id,
    required this.name,
    required this.isRented,
    this.rentedUserId,
    required this.publishedDate,
    this.rentedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book && runtimeType == other.runtimeType && id == other.id);

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Book{ id: $id, name: $name, isRented: $isRented, rentedUserId: $rentedUserId, publishedDate: $publishedDate, rentedAt: $rentedAt,}';
  }

  Book copyWith({
    int? id,
    String? name,
    bool? isRented,
    int? rentedUserId,
    DateTime? publishedDate,
    DateTime? rentedAt,
  }) {
    return Book(
      id: id ?? this.id,
      name: name ?? this.name,
      isRented: isRented ?? this.isRented,
      rentedUserId: rentedUserId ?? this.rentedUserId,
      publishedDate: publishedDate ?? this.publishedDate,
      rentedAt: rentedAt ?? this.rentedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isRented': isRented,
      'rentedUserId': rentedUserId,
      'publishedDate': publishedDate,
      'rentedAt': rentedAt,
    };
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      name: json['name'] as String,
      isRented: json['isRented'] as bool,
      rentedUserId: json['rentedUserId'],
      publishedDate: DateTime.parse(json['publishedDate'] as String),
      rentedAt: json['rentedAt'] != null
          ? DateTime.parse(json['rentedAt'] as String)
          : null,
    );
  }
//</editor-fold>
}
