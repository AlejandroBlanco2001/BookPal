import 'package:bookpal/core/util/utilities.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Rating extends Equatable {

  final int? id;
  final int rating;
  @JsonKey(name: 'physical_book_barcode')
  final String physicalBookBarcode;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'created_at', fromJson: Utilities.fromISO8601StringNullable, toJson: Utilities.toISO8601String)
  final DateTime? createdAt;

  const Rating({
    this.id,
    required this.rating,
    required this.physicalBookBarcode,
    this.userId,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id, rating, physicalBookBarcode, userId, createdAt];
}