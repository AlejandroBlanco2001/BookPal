

import 'package:bookpal/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required String id,
    required String referenceId,
    required String author,
    String? originalTitle,
    DateTime? publishDate
  }) : super(
    id: id,
    referenceId: referenceId,
    author: author,
    originalTitle: originalTitle,
    publishDate: publishDate
  );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    id: json['id'] ?? "",
    referenceId: json['referenceId'] ?? "",
    author: json['author'] ?? "",
    originalTitle: json['originalTitle'] ?? "",
    publishDate: json['publishDate']
  );

}