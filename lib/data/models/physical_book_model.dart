

import 'package:bookpal/data/enums/book_status.dart';
import 'package:bookpal/domain/entities/physical_book.dart';

class PhysicalBookModel extends PhysicalBook {
  PhysicalBookModel({
    required String id,
    required String barcode,
    required String referenceId,
    required String title,
    String? edition,
    required String deweyCode,
    required DateTime creationDate,
    String? isbn,
    String? isbn13,
    String? publisher,
    DateTime? publishDate,
    String? language,
    BookStatus status = BookStatus.available,
    String? bibliographicGps,
  }) : super(
    id: id,
    barcode: barcode,
    referenceId: referenceId,
    title: title,
    edition: edition,
    deweyCode: deweyCode,
    creationDate: creationDate,
    isbn: isbn,
    isbn13: isbn13,
    publisher: publisher,
    publishDate: publishDate,
    language: language,
    status: status,
    bibliographicGps: bibliographicGps,
  );

  @override
  factory PhysicalBookModel.fromJson(Map<String, dynamic> json) => PhysicalBookModel(
    id: json['id'] ?? "",
    barcode: json['barcode'] ?? "",
    referenceId: json['referenceId'] ?? "",
    title: json['title'] ?? "",
    edition: json['edition'] ?? "",
    deweyCode: json['deweyCode'] ?? "",
    creationDate: json['creationDate'] ?? "",
    isbn: json['isbn'] ?? "",
    isbn13: json['isbn13'] ?? "",
    publisher: json['publisher'] ?? "",
    publishDate: json['publicationDate'] ?? "",
    language: json['language'] ?? "",
    status: json['status'] ?? "",
    bibliographicGps: json['bibliographicGps'] ?? "",
  );
}