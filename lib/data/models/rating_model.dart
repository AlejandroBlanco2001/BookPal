import 'package:bookpal/domain/entities/rating.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel extends Rating {
  const RatingModel({
    int? id,
    required double rating,
    required String physicalBookBarcode,
    int? userId,
    DateTime? createdAt,
  }) : super(
    id: id,
    rating: rating,
    physicalBookBarcode: physicalBookBarcode,
    userId: userId,
    createdAt: createdAt,
  );

  factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}