
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/domain/entities/rating.dart';

abstract class RatingRepository {
  Future<DataState<List<Rating>>> getUserRatings();
  Future<DataState<Rating>> postRating(Map<String,dynamic> fields);
  Future<DataState<Rating>> putRating(int id, Map<String,dynamic> fields);
}