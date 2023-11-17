import 'package:bookpal/core/util/utilities.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Rating extends Equatable {

  final int id;
  final double rating;
  @JsonKey(name: 'physical_book_barcode')
  final String physicalBookBarcode;
  @JsonKey(name: 'user_id')
  final int userId;
  final String email;
  @JsonKey(name: 'created_at', fromJson: Utilities.fromISO8601StringNullable, toJson: Utilities.toISO8601String)
  final DateTime? createdAt;

  const Rating({
    required this.id,
    required this.rating,
    required this.physicalBookBarcode,
    required this.userId,
    required this.email,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id, rating, physicalBookBarcode, userId, email, createdAt];
}