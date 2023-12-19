import 'package:book_lent_manager/util/date_time_formatter.dart';

class BookDto {
  int id;
  String? name;
  bool? isRented;
  int? rentedUserId;
  DateTime? publishedDate;
  DateTime? rentedAt;

//<editor-fold desc="Data Methods">
  BookDto({
    required this.id,
    this.name,
    this.isRented,
    this.rentedUserId,
    this.publishedDate,
    this.rentedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookDto && runtimeType == other.runtimeType && id == other.id);

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'BookDto{ id: $id, name: $name, isRented: $isRented, rentedUserId: $rentedUserId, publishedAt: $publishedDate, rentedAt: $rentedAt,}';
  }

  BookDto copyWith({
    int? id,
    String? name,
    bool? isRented,
    int? rentedUserId,
    DateTime? publishedDate,
    DateTime? rentedAt,
  }) {
    return BookDto(
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
      'publishedDate':
          publishedDate != null ? dateFormatter.format(publishedDate!) : null,
      'rentedAt': rentedAt != null ? dateTimeFormatter.format(rentedAt!) : null,
    };
  }

  factory BookDto.fromJson(Map<String, dynamic> json) {
    return BookDto(
      id: json['id'] as int,
      name: json['name'],
      isRented: json['isRented'],
      rentedUserId: json['rentedUserId'],
      publishedDate: json['rentedUserId'] != null
          ? DateTime.parse(json['publishedDate'] as String)
          : null,
      rentedAt: json['rentedAt'] != null
          ? DateTime.parse(json['rentedAt'] as String)
          : null,
    );
  }
//</editor-fold>
}
