

import 'package:bookpal/data/enums/book_status.dart';
import 'package:bookpal/domain/entities/physical_book.dart';
import 'package:json_annotation/json_annotation.dart';

part 'physical_book_model.g.dart';

@JsonSerializable()
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
    String bookCover = '/no_cover.jpg',
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
    bookCover: '',
    status: status,
    bibliographicGps: bibliographicGps,
  );

  factory PhysicalBookModel.fromJson(Map<String, dynamic> json) => _$PhysicalBookModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhysicalBookModelToJson(this);

}