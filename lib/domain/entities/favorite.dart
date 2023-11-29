import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/domain/entities/physical_book.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Favorite extends Equatable {
  final int? id;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'physical_book_barcode')
  final String physicalBookBarcode;
  @JsonKey(name: 'physical_book', fromJson: Utilities.physicalBookFromJsonNullable, toJson: Utilities.physicalBookToJsonNullable)
  final PhysicalBook? physicalBook;
  @JsonKey(name: 'created_at', fromJson: Utilities.fromISO8601StringNullable, toJson: Utilities.toISO8601String)
  final DateTime? createdAt;

  const Favorite({
    this.id,
    this.userId,
    required this.physicalBookBarcode,
    this.physicalBook,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    physicalBook,
    createdAt,
  ];
}