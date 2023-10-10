

import 'package:bookpal/data/enums/book_status.dart';
import 'package:equatable/equatable.dart';

abstract class PhysicalBook extends Equatable {
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
  final DateTime? publicationDate;
  final String? language;
  final BookStatus status;
  final String? bibliographicGps;

  const PhysicalBook({
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
    this.publicationDate,
    this.language,
    this.status = BookStatus.available,
    this.bibliographicGps,
  });

  @override
  List<Object?> get props => [
    id,
    barcode,
    referenceId,
    title,
    edition,
    deweyCode,
    creationDate,
    isbn,
    isbn13,
    publisher,
    publicationDate,
    language,
    status,
    bibliographicGps,
  ];
}