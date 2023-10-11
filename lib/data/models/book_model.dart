

import 'package:bookpal/domain/entities/book.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
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

  factory BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);

}