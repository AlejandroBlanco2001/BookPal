import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/rating.dart';
import 'package:bookpal/domain/repositories/rating_repository.dart';

class UpdateRatingUsecase extends Usecase<DataState<Rating>> {
  final RatingRepository _ratingRepository;

  UpdateRatingUsecase(this._ratingRepository);

  @override
  Future<DataState<Rating>> call({Map<String, dynamic>? params}) {
    int id = params!['id'];
    Map<String, dynamic> fields = params['fields'];
    return _ratingRepository.putRating(id, fields);
  }
}