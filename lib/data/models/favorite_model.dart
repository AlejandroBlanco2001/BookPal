import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/domain/entities/favorite.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookpal/core/util/utilities.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel extends Favorite {
  const FavoriteModel({
    required int id,
    required int userId,
    required String physicalBookBarcode,
    required PhysicalBookModel physicalBook,
    required DateTime createdAt,
  }) : super(
          id: id,
          userId: userId,
          physicalBookBarcode: physicalBookBarcode,
          physicalBook: physicalBook,
          createdAt: createdAt,
        );

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}