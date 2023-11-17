import 'package:bookpal/domain/entities/rating.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel extends Rating {
  const RatingModel({
    required int id,
    required double rating,
    required String physicalBookBarcode,
    required int userId,
    required String email,
    DateTime? createdAt,
  }) : super(
    id: id,
    rating: rating,
    physicalBookBarcode: physicalBookBarcode,
    userId: userId,
    email: email,
    createdAt: createdAt,
  );

  factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}