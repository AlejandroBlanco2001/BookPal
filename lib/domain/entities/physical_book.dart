

import 'package:bookpal/data/enums/book_status.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class PhysicalBook {
  final int id;
  final String barcode;
  @JsonKey(name: 'reference_id')
  final int referenceId;
  @JsonKey(name: 'collection_id')
  final int collectionId;
  final String title;
  final String? edition;
  @JsonKey(name: 'dewey_code')
  final String deweyCode;
  @JsonKey(name: 'creation_date')
  final DateTime creationDate;
  final String? isbn;
  final String? isbn13;
  final String? publisher;
  @JsonKey(name: 'publish_date')
  final DateTime? publishDate;
  final String? language;
  @JsonKey(name: 'book_cover')
  String? bookCover;
  BookStatus status;
  final String? bibliographicGps;

  PhysicalBook({
    required this.id,
    required this.barcode,
    required this.referenceId,
    required this.collectionId,
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