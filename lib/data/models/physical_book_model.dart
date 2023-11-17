

import 'package:bookpal/data/enums/book_status.dart';
import 'package:bookpal/domain/entities/physical_book.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookpal/core/util/utilities.dart';

part 'physical_book_model.g.dart';

@JsonSerializable()
class PhysicalBookModel extends PhysicalBook {
  PhysicalBookModel({
    required int id,
    required String barcode,
    required author,
    required int referenceId,
    required int collectionId,
    required String title,
    String? edition,
    required String deweyCode,
    required DateTime creationDate,
    int? rating,
    List<Map<String,dynamic>>? ratings = const [],
    String? isbn,
    String? isbn13,
    String? publisher,
    DateTime? publishDate,
    String? language,
    String bookCover = '/no_cover.jpg',
    BookStatus status = BookStatus.available,
    String? bibliographicGps,
  }) : super(
    id: id,
    barcode: barcode,
    author: author,
    referenceId: referenceId,
    collectionId: collectionId,
    title: title,
    edition: edition,
    rating: rating,
    ratings: ratings,
    deweyCode: deweyCode,
    creationDate: creationDate,
    isbn: isbn,
    isbn13: isbn13,
    publisher: publisher,
    publishDate: publishDate,
    language: language,
    bookCover: bookCover,
    status: status,
    bibliographicGps: bibliographicGps,
  );

  factory PhysicalBookModel.fromJson(Map<String, dynamic> json) => _$PhysicalBookModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhysicalBookModelToJson(this);

}