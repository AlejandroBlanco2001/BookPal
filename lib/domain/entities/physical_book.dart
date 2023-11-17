

import 'package:bookpal/data/enums/book_status.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookpal/core/util/utilities.dart';


abstract class PhysicalBook extends Equatable {
  final int id;
  final String barcode;
  @JsonKey(name: 'reference_id')
  final int referenceId;
  @JsonKey(name: 'collection_id')
  final int collectionId;
  final String author;
  final String title;
  final String? edition;
  @JsonKey(name: 'dewey_code')
  final String deweyCode;
  @JsonKey(name: 'creation_date')
  final DateTime creationDate;
  final String? isbn;
  final String? isbn13;
  final String? publisher;
  @JsonKey(name: 'publish_date', fromJson: Utilities.fromISO8601StringNullable, toJson: Utilities.toISO8601String)
  final DateTime? publishDate;
  final String? language;
  @JsonKey(name: 'book_cover')
  final String bookCover;
  final BookStatus status;
  final String? bibliographicGps;
  final int? rating;
  final List<Map<String,dynamic>>? ratings;


  const PhysicalBook({
    required this.id,
    required this.barcode,
    required this.author,
    required this.referenceId,
    required this.collectionId,
    required this.title,
    this.edition,
    required this.deweyCode,
    required this.creationDate,
    this.rating,
    this.ratings,
    this.isbn,
    this.isbn13,
    this.publisher,
    this.publishDate,
    this.language,
    this.bookCover = '/no_cover.jpg',
    this.status = BookStatus.available,
    this.bibliographicGps,
  });

  @override
  List<Object?> get props => [
    id,
    barcode,
    author,
    referenceId,
    collectionId,
    title,
    edition,
    deweyCode,
    creationDate,
    rating,
    isbn,
    isbn13,
    publisher,
    publishDate,
    language,
    bookCover,
    status,
    bibliographicGps,
  ];
}