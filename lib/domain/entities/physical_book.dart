

import 'package:bookpal/data/enums/book_status.dart';

abstract class PhysicalBook {
  final String id;
  final String barcode;
  final String referenceId;
  final String title;
  final String? edition;
  final String deweyCode;
  final DateTime creationDate;
  final String? isbn;
  final String? isbn13;
  final String? publisher;
  final DateTime? publishDate;
  final String? language;
  String? bookCover;
  BookStatus status;
  final String? bibliographicGps;

  PhysicalBook({
    required this.id,
    required this.barcode,
    required this.referenceId,
    required this.title,
    this.edition,
    required this.deweyCode,
    required this.creationDate,
    this.isbn,
    this.isbn13,
    this.publisher,
    this.publishDate,
    this.language,
    this.bookCover = '/no_cover.jpg',
    this.status = BookStatus.available,
    this.bibliographicGps,
  });
}